import '../utils/name_utils.dart';
import '../utils/name_utils.dart';

class User {
  String _name;
  String phoneNumber;

  User({
    required String name,
    required this.phoneNumber,
  }) : _name = formatDisplayName(name);

  String get name => _name;

  set name(String newName) {
    _name = formatDisplayName(newName);
  }
}
