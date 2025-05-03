import 'package:flutter/material.dart';
import 'package:musi/pages/settings_page.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: const BoxConstraints(maxHeight: 45),
      elevation: const WidgetStatePropertyAll(0.0),
      leading: const Icon(Icons.search_outlined),
      hintText: "Search",
      hintStyle: const WidgetStatePropertyAll(
        TextStyle(),
      ),
      trailing: [
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ));
          },
        ),
      ],
      backgroundColor:
      WidgetStatePropertyAll
          (Theme.of(context).colorScheme.secondary),
    );
  }
}
