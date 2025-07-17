import 'dart:io';
import 'package:library_system/models/regular_member.dart';
import 'package:library_system/services/library_service.dart';

void register(Library library) {
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();

  if (name == null || name.trim().isEmpty) {
    print('Name is required.');
    return;
  }

  stdout.write('Enter your phone number: ');
  String? phone = stdin.readLineSync();
  stdout.write('Create a password: ');
  String? password = stdin.readLineSync();

  if ([phone, password].any((x) => x == null || x.trim().isEmpty)) {
    print('All fields are required.');
    return;
  }

  final newMember = RegularMember(
    name: name.trim(),
    phoneNumber: phone!.trim(),
    password: password!.trim(),
  );

  library.addUser(newMember);
  print('Account created successfully!');
  print('Your ID is: ${newMember.id}');
  print('Save it to log in later.');
}
