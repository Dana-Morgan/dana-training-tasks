import '../models/user.dart';
import '../models/librarian.dart';
import '../models/member.dart';
import '../models/premium_member.dart';
import '../models/regular_member.dart';

enum AddUserResult {
  success,
  nameAlreadyExists,
}

class Library {
  final List<User> users = [];

  AddUserResult addUser(User user) {
  final exists = users.any((u) => u.originalName == user.originalName);
    if (exists) {
      return AddUserResult.nameAlreadyExists;
    }
    users.add(user);
    return AddUserResult.success;
  }

  List<String> listUsers() {
    return users.map((user) {
      if (user is Librarian) {
        return 'Librarian: ${user.displayName}, Employee ID: ${user.employeeId}';
      } else if (user is Member) {
        return 'Member: ${user.displayName}, Max Borrow Limit: ${user.maxBorrowLimit}';
      } else {
        return 'User: ${user.displayName}';
      }
    }).toList();
  }

  List<String> listMembers() {
    return users.whereType<Member>().map((member) {
      if (member is PremiumMember) {
        return 'Premium Member: ${member.displayName}, Max Borrow Limit: ${member.maxBorrowLimit}';
      } else {
        return 'Regular Member: ${member.displayName}, Max Borrow Limit: ${member.maxBorrowLimit}';
      }
    }).toList();
  }

  List<String> listLibrarians() {
    return users.whereType<Librarian>().map((librarian) {
      return 'Librarian: ${librarian.displayName}, Employee ID: ${librarian.employeeId}, Position: ${librarian.position}';
    }).toList();
  }

  User? findUserByName(String name) {
  try {
    return users.firstWhere(
      (user) => user.originalName == name,
    );
  } catch (e) { // i can also do orelse: ()=>null as User instead of try/catch
    return null;
  }
}


}
