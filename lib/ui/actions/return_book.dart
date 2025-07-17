import 'dart:io';
import 'package:library_system/models/member.dart';

void handleReturnBook(Member member) {
  if (member.borrowedBooks.isEmpty) {
    print('You have no books to return.');
    return;
  }

  print('\nYour Borrowed Books:');
  for (int i = 0; i < member.borrowedBooks.length; i++) {
    print('${i + 1}. ${member.borrowedBooks[i].title}');
  }

  stdout.write('Enter number of the book to return: ');
  String? input = stdin.readLineSync();
  int? index = int.tryParse(input ?? '');

  if (index != null && index >= 1 && index <= member.borrowedBooks.length) {
    var book = member.borrowedBooks[index - 1];
    member.returnItem(book);
  } else {
    print('Invalid selection.');
  }
}
