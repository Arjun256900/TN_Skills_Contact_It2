import 'package:contacts_app_2/core/utils/utils.dart';
import 'package:contacts_app_2/features/contacts/controllers/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/models/contact.dart';

class EditContactScreen extends StatefulWidget {
  final Contact? contact;

  const EditContactScreen({super.key, this.contact});

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  late TextEditingController nameCtrl;
  late TextEditingController phoneCtrl;
  final Utils utils = Utils();

  @override
  void initState() {
    nameCtrl = TextEditingController(text: widget.contact?.name ?? "");
    phoneCtrl = TextEditingController(text: widget.contact?.phone ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ContactController>();
    final isEditing = widget.contact != null;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text(isEditing ? "Edit Contact" : "New Contact")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: "Phone"),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (isEditing) {
                    controller.addOrUpdateContact(
                      widget.contact!.copyWith(
                        name: nameCtrl.text,
                        phone: phoneCtrl.text,
                      ),
                    );
                  } else {
                    final contact = Contact(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: nameCtrl.text,
                      phone: phoneCtrl.text,
                    );
                    if (!utils.contactValidator(contact)) return;
                    controller.addOrUpdateContact(contact);
                  }

                  Navigator.pop(context);
                },
                child: SizedBox(
                  width: 100,
                  child: Text(
                    isEditing ? "Update" : "Save",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
