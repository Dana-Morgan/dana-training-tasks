import 'member.dart';

class PremiumMember extends Member {
  PremiumMember({
    required super.name,
    required super.phoneNumber,
    super.password,
  });

  @override
  int get borrowMultiplier => 3;
}
