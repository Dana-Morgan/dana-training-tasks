import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/librarian.dart';
import 'package:library_system/models/regular_member.dart';
import 'package:library_system/models/premium_member.dart';

void handleUserAddition(Library library) {
  stdout.write('Enter user type (Librarian/Member) or "exit" to cancel: ');
  String? userType = stdin.readLineSync();

  if (userType == null || userType.toLowerCase() == 'exit') return;

  if (userType.toLowerCase() == 'librarian') {
    _addLibrarian(library);
  } else if (userType.toLowerCase() == 'member') {
    _addMember(library);
  } else {
    print('Invalid user type.');
  }
}

void _addLibrarian(Library library) {
  stdout.write('Enter name: ');
  String? name = stdin.readLineSync();
  stdout.write('Enter phone number: ');
  String? phone = stdin.readLineSync();
  stdout.write('Enter employee ID: ');
  String? employeeId = stdin.readLineSync();
  stdout.write('Enter position (default is Staff): ');
  String? position = stdin.readLineSync();

  if ([name, phone, employeeId].any((v) => v == null || v.trim().isEmpty)) {
    print('Invalid input. Please try again.');
    return;
  }

  final result = library.addUser(Librarian(
    name: name!.trim(),
    phoneNumber: phone!.trim(),
    employeeId: employeeId!.trim(),
    hireDate: DateTime.now(),
    position: (position?.trim().isEmpty ?? true) ? 'Staff' : position!.trim(),
  ));

  if (result == AddUserResult.nameAlreadyExists) {
    print('User with this name already exists.');
  } else {
    print('Librarian added successfully!');
  }
}

void _addMember(Library library) {
  stdout.write('Enter user type (regular/premium): ');
  String? memberType = stdin.readLineSync();

  if (memberType == null ||
      !(memberType.toLowerCase() == 'regular' ||
        memberType.toLowerCase() == 'premium')) {
    print('Invalid member type.');
    return;
  }

  stdout.write('Enter name: ');
  String? name = stdin.readLineSync();
  stdout.write('Enter phone number: ');
  String? phone = stdin.readLineSync();

  if (name == null || phone == null) {
    print('Invalid input.');
    return;
  }

  final result = (memberType.toLowerCase() == 'regular')
      ? library.addUser(RegularMember(name: name.trim(), phoneNumber: phone.trim()))
      : library.addUser(PremiumMember(name: name.trim(), phoneNumber: phone.trim()));

  if (result == AddUserResult.nameAlreadyExists) {
    print('User with this name already exists.');
  } else {
    print('Member added successfully!');
  }
}
