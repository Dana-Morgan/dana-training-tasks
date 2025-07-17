import 'dart:math';
import '../utils/name_utils.dart';

class User {
  static final Random _random = Random();
  static final Set<String> _usedIds = {};

  final String id;
  String _originalName;
  String phoneNumber;
  String password;

  User({
    required String name,
    required this.phoneNumber,
    String? password,
    String? id,
  })  : _originalName = name,
        password = password ?? '0000',
        id = id ?? _generateUniqueId();

  static String _generateUniqueId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String newId;
    do {
      newId = List.generate(4, (index) => chars[_random.nextInt(chars.length)]).join();
    } while (_usedIds.contains(newId));
    _usedIds.add(newId);
    return newId;
  }

  String get name => formatDisplayName(_originalName);
  String get displayName => formatDisplayName(_originalName);
  String get originalName => _originalName;

  set originalName(String newName) => _originalName = newName;
  set phoneNumberValue(String newPhone) => phoneNumber = newPhone;
}
