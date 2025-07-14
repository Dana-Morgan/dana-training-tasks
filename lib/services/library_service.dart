
import '../models/user.dart';
import '../utils/name_utils.dart';

class Library {
  final List<User> users = [];


  void addUser(User user) {
    final exists = users.any((u) => u.name == user.name);
    if (exists) {
      print('User with this name already exists.');
      return;
    }
    users.add(user);
  }
}
