import 'member.dart';

class RegularMember extends Member {
  RegularMember({required String name, required String phoneNumber})
      : super(name: name, phoneNumber: phoneNumber);

  @override
  int get borrowMultiplier => 1;
}
