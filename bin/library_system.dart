import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/premium_member.dart';
import 'package:library_system/models/regular_member.dart';
import 'package:library_system/models/member.dart';

void main() {
  final library = Library();

  library.addUser(RegularMember(name: 'dana555morgan', phoneNumber: '8512512'));
  library.addUser(PremiumMember(name: 'suzan55', phoneNumber: '48523154'));

  while (true) {
    print('\n--- Add a User ---');
    stdout.write('Enter user type (regular/premium or "exit" to stop): ');
    String? typeInput = stdin.readLineSync();

    if (typeInput == null || typeInput.toLowerCase() == 'exit') {
      break;
    }

    if (typeInput.toLowerCase() != 'regular' && typeInput.toLowerCase() != 'premium') {
      print('Invalid user type. Please enter "regular" or "premium".');
      continue;
    }

    stdout.write('Enter name: ');
    String? name = stdin.readLineSync();

    stdout.write('Enter phone number: ');
    String? phone = stdin.readLineSync();

    if (name == null || phone == null || name.trim().isEmpty || phone.trim().isEmpty) {
      print('Invalid input. Try again.');
      continue;
    }

    if (typeInput.toLowerCase() == 'regular') {
      library.addUser(RegularMember(name: name.trim(), phoneNumber: phone.trim()));
    } else {
      library.addUser(PremiumMember(name: name.trim(), phoneNumber: phone.trim()));
    }
  }

  print('\n--- All Users ---');
  for (var user in library.users) {
    if (user is Member) {
      print('User: ${user.name}, Phone: ${user.phoneNumber} - Max Borrow Limit: ${user.maxBorrowLimit} - type: ${user is PremiumMember ? 'Premium' : 'Regular'}');
    } else {
      print('User: ${user.name}, Phone: ${user.phoneNumber} - type: ${user is PremiumMember ? 'Premium' : 'Regular'}');
    }
  }
}
