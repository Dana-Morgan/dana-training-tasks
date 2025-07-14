import '../models/user.dart';

enum AddUserResult {
  success,
  nameAlreadyExists,
}

class Library {
  final List<User> users = [];

  AddUserResult addUser(User user) {
    final exists = users.any((u) => u.name.toLowerCase() == user.name.toLowerCase());
    if (exists) {
      return AddUserResult.nameAlreadyExists;
    }
    users.add(user);
    return AddUserResult.success;
  }
}
