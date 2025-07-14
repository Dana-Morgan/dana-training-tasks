import '../utils/name_utils.dart';

class User {
  final String name;
  final String phoneNumber;

  User({
    required String name,
    required this.phoneNumber,
  }) : name = formatDisplayName(name);
}
