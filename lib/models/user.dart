import '../utils/name_utils.dart';
import '../utils/name_utils.dart';

class User {
  String _originalName;
  String phoneNumber;

  User({
    required String name,
    required this.phoneNumber,
  }) : _originalName = name;

  String get displayName => formatDisplayName(_originalName);

  String get originalName => _originalName;

  set originalName(String newName) {
    _originalName = newName;
  }

  set phoneNumberValue(String newPhone) {
    phoneNumber = newPhone;
  }
}

