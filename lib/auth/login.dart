import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/librarian.dart';
import 'package:library_system/models/member.dart';
import 'package:library_system/ui/menus/librarian_menu.dart';
import 'package:library_system/ui/menus/member_menu.dart';

void login(Library library) {
  stdout.write('Enter your ID: ');
  String? id = stdin.readLineSync();
  stdout.write('Enter your password: ');
  String? password = stdin.readLineSync();

  if (id == null || password == null) {
    print('Invalid input.');
    return;
  }

  var user = library.authenticateById(id.trim(), password.trim());

  if (user != null) {
    print('Welcome back, ${user.displayName} (ID: ${user.id})');
    if (user is Librarian) {
      handleLibrarianMenu(user, library);
    } else if (user is Member) {
      handleMemberMenu(user, library);
    }
  } else {
    print('Invalid credentials.');
  }
}
