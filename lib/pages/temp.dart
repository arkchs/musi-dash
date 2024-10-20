import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        ExpansionTile(
          title: Text("hello there"),
          children: [
            ListTile(
              title: Text("hello there"),
            ),
            ListTile(
              title: Text("hello there"),
            ),
            ListTile(
              title: Text("hello there"),
            ),
          ],
        )
      ]),
    );
  }
}
