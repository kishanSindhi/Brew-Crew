import 'package:demo_firebase/models/brew.dart';
import 'package:demo_firebase/screen/home/brew_list.dart';
import 'package:demo_firebase/services/authincate.dart';
import 'package:flutter/material.dart';
import 'package:demo_firebase/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew?>?>.value(
      value: DatabaseService(uid: "").brews,
      initialData: null,
      catchError: (_, __) => null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BREW CREW"),
          centerTitle: true,
          backgroundColor: Colors.brown[500],
          actions: [
            IconButton(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.logout),
              tooltip: "Logout",
            ),
          ],
        ),
        backgroundColor: Colors.brown[100],
        body: const BrewList(),
      ),
    );
  }
}
