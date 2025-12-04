import 'package:contacts_app_2/data/models/contact.dart';
import 'package:contacts_app_2/data/repositories/contact_repository.dart';
import 'package:flutter/material.dart';

class ContactController extends ChangeNotifier {
  final ContactRepository contactsRepo = ContactRepository();

  List<Contact> allContacts = [];
  List<Contact> filteredContacts = [];

  void loadContacts() {
    allContacts = contactsRepo.fetchAllContacts();
    allContacts.sort((a, b) => a.name.compareTo(b.name));
    filteredContacts = List.from(allContacts);
    notifyListeners();
  }

  ContactController() {
    loadContacts();
  }

  Future<void> addOrUpdateContact(Contact c) async {
    await contactsRepo.addOrUpdateContact(c);
    loadContacts();
  }

  Future<void> deleteContact(Contact c) async {
    await contactsRepo.deleteContact(c);
    loadContacts();
  }

  void searchContact(String query) {
    if (query.isEmpty) {
      filteredContacts = allContacts;
    } else {
      filteredContacts = allContacts
          .where((c) => c.name.toLowerCase().contains(query))
          .toList();
    }
    notifyListeners();
  }
}
