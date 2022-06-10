import 'package:demo_firebase/services/authincate.dart';
import 'package:demo_firebase/shared/loading.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.toggleView}) : super(key: key);
  final VoidCallback toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  bool loading = false;
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Register"),
              centerTitle: true,
            ),
            backgroundColor: Colors.brown[50],
            body: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Enter email" : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      validator: (value) =>
                          (value!.length < 8) ? "Enter proper password" : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = "something went wrong";
                            });
                          }
                        }
                      },
                      child: const Text("Sign up"),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account | "),
                        TextButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
