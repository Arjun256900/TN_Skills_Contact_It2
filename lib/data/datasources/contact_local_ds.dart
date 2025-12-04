import 'package:contacts_app_2/core/hive/hive_keys.dart';
import 'package:contacts_app_2/data/models/contact.dart';
import 'package:hive/hive.dart';

class ContactLocalDs {
  final Box<Contact> box = Hive.box<Contact>(HiveKeys.contactsBox);

  List<Contact> getAllContacts() {
    return box.values.toList();
  }

  Future<void> addOrUpdateContact(Contact c) async {
    await box.put(c.id, c);
  }

  Future<void> deleteContact(Contact c) async {
    await box.delete(c.id);
  }
}
