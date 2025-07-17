import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/librarian.dart';
import 'package:library_system/models/book.dart';
import 'package:library_system/models/genre.dart';
import 'package:library_system/utils/genre_extensions.dart';
import 'package:library_system/auth/login.dart';
import 'package:library_system/auth/register.dart';

void main() {
  final library = Library();
  library.addUser(
    Librarian(
      name: 'John Doe',
      phoneNumber: '1234567890',
      password: 'admin123',
      hireDate: DateTime.now(),
      position: 'Senior Librarian',
      id: 'lib001',
    ),
  );

  library.addBook(
    Book(
      title: 'Sample Book',
      author: 'John Smith',
      genre: Genre.Fiction,
      stock: 1,
    ),
  );
  library.addBook(
    Book(
      title: 'Another Book',
      author: 'Jane Doe',
      genre: Genre.non_Fiction_tt,
      stock: 3,
    ),
  );
  library.addBook(
    Book(
      title: 'Third Book',
      author: 'Jane Doe',
      genre: Genre.Biography,
      stock: 0,
    ),
  );

  runLibrarySystem(library);
}

void runLibrarySystem(Library library) {
  print('Welcome to the Library System!');
  print('list all users:');
  for (var user in library.listUsers()) {
    print(user);
  }
  print('Available Genres:');
  for (var genre in Genre.values) {
    print('- ${genre.normalizeGenreInput()}');
  }

  authenticateFlow(library);
}

void authenticateFlow(Library library) {
  while (true) {
    print('\nAuthentication Menu');
    print('1. Login');
    print('2. Register "Member"');
    print('3. Exit');

    stdout.write('Enter your choice: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        login(library);
        break;
      case '2':
        register(library);
        break;
      case '3':
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid option.');
    }
  }
}
