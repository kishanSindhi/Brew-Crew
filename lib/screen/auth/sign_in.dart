import 'package:demo_firebase/services/authincate.dart';
import 'package:demo_firebase/shared/loading.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleView}) : super(key: key);
  final VoidCallback toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // Text field state
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: const Text("Login in"),
              centerTitle: true,
            ),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter email";
                        }
                      },
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) =>
                          (value!.length < 8) ? "Enter valid password" : null,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .loginWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                    "Enter valid email and password"),
                                action: SnackBarAction(
                                  label: "OK",
                                  onPressed: () {},
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text("Login in"),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Dont have an account | "),
                        TextButton(
                          onPressed: () {
                            widget.toggleView();
                          },
                          child: const Text(
                            "Signup",
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
        // child: ElevatedButton(
        //   child: const Text("Sign In Anon"),
        //   onPressed: () async {
        //     dynamic result = await _auth.signInAnon();
        //     if (result == null) {
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text("Fail ${result.uID}"),
        //           action: SnackBarAction(
        //             label: "OK",
        //             onPressed: () {},
        //           ),
        //         ),
        //       );
        //     } else {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text("Success ${result.uID}"),
              //     action: SnackBarAction(
              //       label: "OK",
              //       onPressed: () {},
              //     ),
              //   ),
              // );
        //     }
        //   },
        // ),
