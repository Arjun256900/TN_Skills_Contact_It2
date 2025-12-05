import 'package:contacts_app_2/features/contacts/controllers/contact_controller.dart';
import 'package:contacts_app_2/features/contacts/presentation/widgets/contact_tile.dart';
import 'package:contacts_app_2/features/contacts/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactsListScreen extends StatefulWidget {
  final Function(ThemeMode) toggleTheme;
  const ContactsListScreen({super.key, required this.toggleTheme});

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ContactController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            children: [
              CustomAppbar(toggleTheme: widget.toggleTheme),
              TextFormField(
                controller: searchController,
                onChanged: (value) {
                  controller.searchContact(searchController.text);
                },
                decoration: InputDecoration(
                  hintText: "Search contacts...",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: controller.filteredContacts.isEmpty
                    ? Center(
                        child: Text(
                          "Your contacts list is empty. Try adding a contact or modifying your search!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.filteredContacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final contact = controller.filteredContacts[index];
                          final currentLetter = contact.name[0];
                          bool showHeader = false;
                          if (index == 0) {
                            showHeader = true;
                          } else {
                            final prevContact =
                                controller.filteredContacts[index - 1];
                            final prevLetter = prevContact.name[0];
                            if (prevLetter != currentLetter) {
                              showHeader = true;
                            }
                          }
                          return Column(
                            children: [
                              if (showHeader) ...[
                                Text(
                                  currentLetter,
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 28,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                              ContactTile(contact: contact),
                            ],
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
