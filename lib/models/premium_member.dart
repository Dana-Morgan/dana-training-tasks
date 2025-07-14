import 'member.dart';

class PremiumMember extends Member {
  PremiumMember({required String name, required String phoneNumber})
      : super(name: name, phoneNumber: phoneNumber);

  @override
  int get borrowMultiplier => 3;
}
