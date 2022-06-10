import 'package:demo_firebase/models/user.dart';
import 'package:demo_firebase/screen/auth/auth.dart';
import 'package:demo_firebase/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
