import 'package:flutter/material.dart';
import 'package:musi/pages/settings_page.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: const MaterialStatePropertyAll(0.0),
      leading: const Icon(Icons.search_outlined),
      hintText: "Search",
      padding: const MaterialStatePropertyAll(EdgeInsets.all(8.0)),
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
          MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
    );
  }
}