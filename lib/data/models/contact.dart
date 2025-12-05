import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 1)
class Contact {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phone;

  Contact({required this.id, required this.name, required this.phone});

  Contact copyWith({String? name, String? phone}) {
    return Contact(id: id, name: name ?? this.name, phone: phone ?? this.phone);
  }
}
