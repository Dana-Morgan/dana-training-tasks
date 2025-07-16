import '../models/user.dart';
import '../models/librarian.dart';
import '../models/member.dart';
import '../models/premium_member.dart';
import '../models/regular_member.dart';
import '../models/book.dart';
import '../models/genre.dart';
import '../utils/stock_utils.dart';

enum AddUserResult {
  success,
  nameAlreadyExists,
}

class Library {
  final List<User> users = [];
  final List<Book> books = [];

  AddUserResult addUser(User user) {
  final exists = users.any((u) => u.originalName == user.originalName);
    if (exists) {
      return AddUserResult.nameAlreadyExists;
    }
    users.add(user);
    return AddUserResult.success;
  }

  List<String> listUsers() {
    return users.map((user) {
      if (user is Librarian) {
        return 'Librarian: ${user.displayName}, Employee ID: ${user.employeeId}';
      } else if (user is Member) {
        return 'Member: ${user.displayName}, Max Borrow Limit: ${user.maxBorrowLimit}';
      } else {
        return 'User: ${user.displayName}';
      }
    }).toList();
  }

  List<String> listMembers() {
    return users.whereType<Member>().map((member) {
      if (member is PremiumMember) {
        return 'Premium Member: ${member.displayName}, Max Borrow Limit: ${member.maxBorrowLimit}';
      } else {
        return 'Regular Member: ${member.displayName}, Max Borrow Limit: ${member.maxBorrowLimit}';
      }
    }).toList();
  }

  List<String> listLibrarians() {
    return users.whereType<Librarian>().map((librarian) {
      return 'Librarian: ${librarian.displayName}, Employee ID: ${librarian.employeeId}, Position: ${librarian.position}';
    }).toList();
  }

  User? findUserByName(String name) {
  try {
    return users.firstWhere(
      (user) => user.originalName == name,
    );
  } catch (e) { // i can also do orelse: ()=>null as User instead of try/catch
    return null;
  }
  }

  void addBook(Book book) {
    books.add(book);
  }

  List<String> listAllBooksWithStock() {
  List<String> result = [];
  for (var book in books) {
    String stockInfo = book.stockInfo.warning.isNotEmpty ? ' (${book.stockInfo.warning})' : '';
    result.add('${book.title} by ${book.author} - Stock: ${book.stock}$stockInfo');
  }
  return result;
}

List<String> listAvailableBooksWithWarning({bool showCriticalWarnings = false}) { // critical warnings i want to show only for librarians so i added a parameter
  List<String> result = [];

  for (var book in books) {
    if (book.isAvailable) {
      var info = book.stockInfo;
      String warning = info.warning.isNotEmpty ? ' (${info.warning})' : '';
      result.add('${book.title} by ${book.author} - Stock: ${book.stock}$warning');

      if (showCriticalWarnings && info.isCritical) {
        print('CRITICAL: "${book.title}" stock is low! (${book.stock})');
      }
    }
  }

  return result;
}



  List<String> listBooksByGenre(Genre genre) {
    var filtered = books.where((book) => book.genre == genre);
    if (filtered.isEmpty) return ['No books found for genre: ${genre.toString().split('.').last}'];
    return filtered.map((book) => book.toString()).toList();
  }

  List<String> searchBooksByTitle(String title) {
    var filtered = books.where((book) => book.title.toLowerCase() == title.toLowerCase());
    if (filtered.isEmpty) return ['No books found with title: $title'];
    return filtered.map((book) => book.toString()).toList(); // i didnt use book.title because i want to print all book details and toString() is overridden in Book class
  }
}



