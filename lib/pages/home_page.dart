import 'package:flutter/material.dart';
import 'package:musi/components/my_search_bar.dart';
import 'package:musi/components/songs_lists.dart';
import 'package:musi/constants/theme/text_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //     suggestionsBuilder: (context, controller) => temp(),
                //     builder: (context, controller) => Text("Hellow")),
                const MySearchBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                  child: Text(
                    'Quick Picks',
                    style: Theme.of(context).textTheme.mainHeading,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  child: const SongsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}