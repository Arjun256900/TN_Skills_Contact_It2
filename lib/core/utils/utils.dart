import 'package:contacts_app_2/data/models/contact.dart';

class Utils {
  bool contactValidator(Contact c) {
    if (c.name.isEmpty || c.phone.isEmpty) return false;
    return true;
  }
}
