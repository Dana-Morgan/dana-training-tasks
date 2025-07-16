import 'user.dart';

class Librarian extends User {
    final String employeeId;
    final DateTime hireDate;
    String position;
    
    Librarian({
        required String name,
        required String phoneNumber,
        required this.employeeId,
        required this.hireDate,
        this.position = 'Staff',
    }) : super(name: name, phoneNumber: phoneNumber);

}
