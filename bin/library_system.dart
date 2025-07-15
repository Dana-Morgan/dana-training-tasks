import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/premium_member.dart';
import 'package:library_system/models/regular_member.dart';

void main() {
  final library = Library();

  library.addUser(RegularMember(name: 'dana555morgan', phoneNumber: '8512512'));
  library.addUser(PremiumMember(name: 'suzan55', phoneNumber: '48523154'));

  while (true) {
    print('\n--- Add a User ---');
    stdout.write('Enter user type (regular/premium) or "exit" to stop: ');
    String? typeInput = stdin.readLineSync();

    if (typeInput == null || typeInput.toLowerCase() == 'exit') {
      break;
    }

    if (typeInput.toLowerCase() != 'regular' && typeInput.toLowerCase() != 'premium') {
      print('Invalid user type. Please enter "regular" or "premium".');
      continue;
    }

    while (true) {
      stdout.write('Enter name: ');
      String? name = stdin.readLineSync();

      stdout.write('Enter phone number: ');
      String? phone = stdin.readLineSync();

      if (name == null || phone == null || name.trim().isEmpty || phone.trim().isEmpty) {
        print('Invalid input. Try again.');
        continue;
      }

      AddUserResult result;
      if (typeInput.toLowerCase() == 'regular') {
        result = library.addUser(RegularMember(name: name.trim(), phoneNumber: phone.trim()));
      } else {
        result = library.addUser(PremiumMember(name: name.trim(), phoneNumber: phone.trim()));
      }

      if (result == AddUserResult.nameAlreadyExists) {
        print('User with this name already exists. Please enter a different name.');
        continue;
      } else {
        print('User added successfully!');
        break;
      }
    }
  }

  print('\n--- All Users ---');
  for (var user in library.users) {
    String type;
    if (user is RegularMember) {
      type = 'Regular Member';
    } else if (user is PremiumMember) {
      type = 'Premium Member';
    } else {
      type = 'Unknown';
    }

    print('User: ${user.displayName}, Phone: ${user.phoneNumber} - Type: $type');
  }

  if (library.users.isNotEmpty) {
    var firstUser = library.users.first;
    print('\n--- Before edit ---');
    print('User: ${firstUser.displayName}, Phone: ${firstUser.phoneNumber}');

    firstUser.originalName = "new_username";
    firstUser.phoneNumber = "99999999";

    print('--- After edit ---');
    print('User: ${firstUser.displayName}, Phone: ${firstUser.phoneNumber}');
  }
}
