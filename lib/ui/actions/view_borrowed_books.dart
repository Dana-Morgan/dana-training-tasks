import 'package:library_system/models/member.dart';

void handleViewBorrowedBooks(Member member) {
  if (member.borrowedBooks.isEmpty) {
    print('No borrowed books.');
  } else {
    print('\nYour Borrowed Books:');
    for (var book in member.borrowedBooks) {
      print('- ${book.title} by ${book.author}');
    }
  }
}
