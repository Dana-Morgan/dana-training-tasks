import 'member.dart';

class RegularMember extends Member {
  RegularMember({
    required super.name,
    required super.phoneNumber,
    super.password,
  });

  @override
  int get borrowMultiplier => 1;
}
