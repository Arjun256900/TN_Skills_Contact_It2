import 'package:flutter/material.dart';

class ContactsListScreen extends StatefulWidget {
  final Function(ThemeMode) toggleTheme;
  const ContactsListScreen({super.key, required this.toggleTheme});

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
