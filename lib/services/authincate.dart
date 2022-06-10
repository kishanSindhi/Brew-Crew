import 'package:demo_firebase/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//  Create user obj based on FirebaseUser
  Users? _usersFromFirebaseUser(User user) {
    return user != null ? Users(uID: user.uid) : null;
  }

//  auth change user Stream this function will decide which page is to be
//  displayed either login one or homepage
  Stream<Users> get users {
    return _auth
        .authStateChanges()
        .map((User? user) => _usersFromFirebaseUser(user!)!);
  }

//  sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _usersFromFirebaseUser(user!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

// register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return _usersFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//  login with email and password
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _usersFromFirebaseUser(user!);
    } catch (e) {
      return null;
    }
  }

//  sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
