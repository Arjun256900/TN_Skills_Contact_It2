import 'package:contacts_app_2/data/models/contact.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;

  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Dismissible(
        key: Key(contact.id),
        onDismissed: (direction) {
          // TODO
        },
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red[400],
          ),
          child: Icon(Icons.delete, color: Colors.white, size: 20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: isDarkMode ? Border.all(color: Colors.grey[800]!) : null,
            boxShadow: isDarkMode
                ? []
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            leading: CircleAvatar(
              radius: 28,
              child: Text(contact.name[0], style: TextStyle(fontSize: 23)),
            ),
            trailing: CircleAvatar(
              radius: 19,
              backgroundColor: const Color.fromARGB(255, 48, 177, 52),
              child: IconButton(
                icon: Icon(Icons.call_outlined, size: 18),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
