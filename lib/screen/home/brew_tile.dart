import 'package:flutter/material.dart';
import 'package:demo_firebase/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew? brew;
  const BrewTile({Key? key, required this.brew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew!.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(brew!.name),
          subtitle: Text('Takes ${brew!.sugar} sugar(s)'),
        ),
      ),
    );
  }
}
