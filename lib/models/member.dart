import 'user.dart';
import 'book.dart';
import 'borrowable.dart';

abstract class Member extends User implements Borrowable<Book> {
  static const int baseLimit = 3;
  final List<Book> borrowedBooks = [];

  Member({required super.name, required super.phoneNumber, super.password});

  int get borrowMultiplier;
  int get maxBorrowLimit => baseLimit * borrowMultiplier;

  @override
  void borrow(Book book) {
    if (borrowedBooks.length >= maxBorrowLimit) {
      print('Borrow limit reached.');
      return;
    }
    if (book.stock <= 0) {
      print('Book "${book.title}" is out of stock.');
      return;
    }
    borrowedBooks.add(book);
    book.stock--;
    print('$displayName borrowed "${book.title}".');
  }

  @override
  void returnItem(Book book) {
    if (!borrowedBooks.contains(book)) {
      print('You did not borrow "${book.title}".');
      return;
    }
    borrowedBooks.remove(book);
    book.stock++;
    print('$displayName returned "${book.title}".');
  }
}
