import 'package:flutter/material.dart';
import 'package:musi/components/app_bar.dart';
import 'package:musi/components/library_list.dart';
import 'package:musi/components/my_search_bar.dart';
import 'package:musi/components/songs_lists.dart';
import 'package:musi/constants/theme/text_theme.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(title: "Explore"),
              //     suggestionsBuilder: (context, controller) => temp(),
              //     builder: (context, controller) => Text("Hellow")),
              const MySearchBar(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                child: Text(
                  'Quick Picks',
                  style: Theme.of(context).textTheme.mainHeading,
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  child: const SongsList(
                    verticalListLen: 4,
                    carouselPages: 5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10.0),
                child: Text(
                  'Covers and Remixes',
                  style: Theme.of(context).textTheme.mainHeading,
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  child: const SongsList(
                    verticalListLen: 4,
                    carouselPages: 5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text(
                  'Albums',
                  style: Theme.of(context).textTheme.mainHeading,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: const LibraryList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
