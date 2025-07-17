import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/member.dart';

void handleBorrowBook(Member member, Library library) {
  var availableBooks = library.listAvailableBooksWithWarning();
  if (availableBooks.isEmpty) {
    print('No books available to borrow.');
    return;
  }

  print('\nAvailable Books to Borrow:');
  for (int i = 0; i < availableBooks.length; i++) {
    print('${i + 1}. ${availableBooks[i]}');
  }

  stdout.write('Enter book number to borrow: ');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');

  if (index != null && index >= 1 && index <= availableBooks.length) {
    var book = library.books.where((b) => b.isAvailable).toList()[index - 1];
    member.borrow(book);
  } else {
    print('Invalid selection.');
  }
}
