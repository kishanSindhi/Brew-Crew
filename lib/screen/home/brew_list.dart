import 'package:demo_firebase/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    // With the help of this brew we can access the document of the DB
    final brews = Provider.of<List<Brew?>?>(context) ?? [];
    // creating a recycler view type widget.
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (BuildContext context, int index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
  // brews.forEach(
  //   (element) {
  //     print(element!.name);
  //   },
  // );
}
