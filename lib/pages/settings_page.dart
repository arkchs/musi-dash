import 'package:flutter/material.dart';
import 'package:musi/constants/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: const BackButton(),
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              title: const Text("Appearance"),
              leading: const Icon(Icons.color_lens),
              trailing: Switch(
                activeColor: Colors.grey,
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
              ),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: const ListTile(
              title: Text("Content"),
              leading: Icon(Icons.account_box),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: const ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: const ListTile(
              title: Text("Storage"),
              leading: Icon(Icons.storage),
            ),
          ),
        ],
      ),
    );
  }
}
