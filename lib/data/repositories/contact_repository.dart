import 'package:contacts_app_2/data/datasources/contact_local_ds.dart';
import 'package:contacts_app_2/data/models/contact.dart';

class ContactRepository {
  final ContactLocalDs ds = ContactLocalDs();

  List<Contact> fetchAllContacts() {
    return ds.getAllContacts();
  }

  Future<void> addOrUpdateContact(Contact c) {
    return ds.addOrUpdateContact(c);
  }

  Future<void> deleteContact(Contact c) {
    return ds.deleteContact(c);
  }
}
