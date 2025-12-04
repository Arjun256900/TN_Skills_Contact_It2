import 'package:contacts_app_2/data/models/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInit {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ContactAdapter());

    await Hive.openBox<Contact>("contactsBox");
  }
}
