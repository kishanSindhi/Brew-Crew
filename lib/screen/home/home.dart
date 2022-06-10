import 'package:demo_firebase/services/authincate.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BREW CREW"),
        centerTitle: true,
        backgroundColor: Colors.brown[500],
        actions: [
          IconButton(
            onPressed: () async {
              dynamic result = await _auth.signOut();
              if (result == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("error"),
                    action: SnackBarAction(
                      label: "OK",
                      onPressed: () {},
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Success"),
                    action: SnackBarAction(
                      label: "OK",
                      onPressed: () {},
                    ),
                  ),
                );
              }
            },
            icon: const Icon(Icons.logout),
            tooltip: "Logout",
          ),
        ],
      ),
      backgroundColor: Colors.brown[50],
    );
  }
}
