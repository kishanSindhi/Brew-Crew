import 'package:demo_firebase/screen/wrapper.dart';
import 'package:demo_firebase/services/authincate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      catchError: (_, __) => null,
      value: AuthService().users,
      initialData: null,
      child: MaterialApp(
        title: 'Firebase',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
