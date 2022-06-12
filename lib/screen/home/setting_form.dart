import 'package:flutter/material.dart';
import 'package:demo_firebase/shared/constants.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  // form input field values
  String _currentName = "";
  String? _currentSugars = "";
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
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
            decoration:
                textInputDecoration.copyWith(hintText: "Enter your name"),
            validator: (val) => val!.isEmpty ? 'Please enter name' : null,
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
            value: _currentStrength.toDouble(),
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (double val) {
              setState(() {
                _currentStrength = val.round();
              });
            },
            activeColor: Colors.brown[_currentStrength],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              print(_currentName);
              print(_currentStrength);
              print(_currentSugars);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}
