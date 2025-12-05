import 'package:contacts_app_2/features/contacts/presentation/screens/edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  final Function(ThemeMode) toggleTheme;
  const CustomAppbar({super.key, required this.toggleTheme});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Arjun!",
                style: TextStyle(fontSize: 18, color: Colors.grey[500]),
              ),
              const SizedBox(height: 6),
              Text(
                "Your Contacts",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: isDarkMode
                    ? Color(0xFF1E1E1E)
                    : Color(0xFFEAEAEA),
                child: IconButton(
                  onPressed: () {
                    widget.toggleTheme(
                      isDarkMode ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                  icon: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: isDarkMode ? Colors.yellow : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 24,
                backgroundColor: isDarkMode
                    ? Color(0xFF1E1E1E)
                    : Color(0xFFEAEAEA),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => EditContactScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
