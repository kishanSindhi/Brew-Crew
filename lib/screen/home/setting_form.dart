import 'package:demo_firebase/models/user.dart';
import 'package:demo_firebase/services/database.dart';
import 'package:demo_firebase/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:demo_firebase/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  // form input field values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uID).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "UPDATE YOUR BREW SETTINGS.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: userData!.name,
                    decoration: textInputDecoration.copyWith(
                        hintText: "Enter your name"),
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter name' : null,
                    onChanged: (val) => setState(() {
                      _currentName = val;
                    }),
                  ),
                  const SizedBox(height: 20),

                  // Dropdown list
                  DropdownButtonFormField<String>(
                    decoration: textInputDecoration,
                    hint: const Text("Number of sugar"),
                    onChanged: (value) {
                      setState(() {
                        _currentSugars = value;
                      });
                    },
                    value: userData.sugar,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar sugar(s)"),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // Slider for Strength
                  Slider(
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    onChanged: (double val) {
                      setState(() {
                        _currentStrength = val.round();
                      });
                    },
                    activeColor:
                        Colors.brown[_currentStrength ?? userData.strength],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await DatabaseService(uid: userData.uid).updateUserData(
                          _currentSugars ?? userData.sugar,
                          _currentName ?? userData.name,
                          _currentStrength ?? userData.strength,
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Update"),
                  ),
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
