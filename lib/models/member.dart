import 'user.dart';

abstract class Member extends User {
  static const int baseLimit = 3;

  Member({required String name, required String phoneNumber})
      : super(name: name, phoneNumber: phoneNumber);

  int get borrowMultiplier;

  int get maxBorrowLimit => baseLimit * borrowMultiplier;
}
