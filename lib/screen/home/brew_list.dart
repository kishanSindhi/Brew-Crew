import 'package:demo_firebase/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    brews.forEach(
      (element) {
        print(element!.name);
      },
    );
    return Container();
  }
}
