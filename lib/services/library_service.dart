import '../models/user.dart';
import '../models/librarian.dart';
import '../models/member.dart';
import '../models/premium_member.dart';
import '../models/regular_member.dart';
import '../models/book.dart';
import '../models/genre.dart';

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
    return books.map((book) {
      String warning = (book.stock <= 2 && book.stock > 0) ? ' (Warning: Only ${book.stock} left!)' : '';
      warning = book.stock == 0 ? ' (Out of stock)' : warning;
      return '${book.title} by ${book.author} - Stock: ${book.stock}$warning';
    }).toList();
  }

  List<String> listAvailableBooksWithWarning() {
    return books.where((b) => b.isAvailable).map((book) {
      String warning = (book.stock <= 2 && book.stock > 0) ? ' (Warning: Only ${book.stock} left!)' : '';
      warning = book.stock == 0 ? ' (Out of stock)' : warning;
      return '${book.title} by ${book.author} - Stock: ${book.stock}$warning';
    }).toList();
  }

  List<String> listBooksByGenre(Genre genre) {
    var filtered = books.where((book) => book.genre == genre);
    if (filtered.isEmpty) return ['No books found for genre: ${genre.toString().split('.').last}'];
    return filtered.map((book) => book.toString()).toList();
  }

  List<String> searchBooksByTitle(String title) {
    var filtered = books.where((book) => book.title.toLowerCase() == title.toLowerCase());
    if (filtered.isEmpty) return ['No books found with title: $title'];
    return filtered.map((book) => book.toString()).toList();
  }
}



