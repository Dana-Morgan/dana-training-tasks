import 'user.dart';

class Librarian extends User {
  final DateTime hireDate;
  String position;

  Librarian({
    required super.name,
    required super.phoneNumber,
    super.password,
    required this.hireDate,
    this.position = 'Staff',
    super.id,
  });
}
