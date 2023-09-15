import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Auth {
  Future<bool> loginUser({required String email, required String password}) async{
    // await Future.delayed(Duration(seconds: 5));
    // return false;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // User successfully logged in
        debugPrint('User logged in: ${userCredential.user!.uid}');
        try {
          DocumentSnapshot<Map<String, dynamic>> doc = await db.collection('users').doc(_auth.currentUser!.uid).get();
          if(doc.exists == false) {
            debugPrint("This client does not exist");
            await _auth.signOut();
            return false;
          } else {
            return true;
          }
        }catch(e) {
          await _auth.signOut();
          return false;
        }
      }
    } catch (e) {
      // Handle login errors
      debugPrint('Error logging in: $e');
    }

    return false; // Login failed
  }

  Future<bool> registerUser({
    required String email,
    required String password,
    required username,
    required phoneNumber,
    required String firstName,
    required String lastName,
    String countryOfResidence = 'Cameroon',
    String? dob,
  }) async{
    // await Future.delayed(Duration(seconds: 5));
    // return false;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // User successfully logged in
        debugPrint('User logged in: ${userCredential.user!.uid}');
        try {
          await db.collection('users')
              .doc(_auth.currentUser!.uid)
              .set({
            'first_name' : firstName,
            'last_name' : lastName,
            'username' : username,
            'password' : password,
            'data_of_birth' : dob,
            'phone_number' : phoneNumber,
            'email' : email
          });

          return true;

        }catch(e) {
          await _auth.signOut();
          return false;
        }
      }
    } catch (e) {
      // Handle login errors
      debugPrint('Error logging in: $e');
    }

    return false; // Login failed

  }


  Future<bool> resetPassword(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.sendPasswordResetEmail(email: email);
      debugPrint("Password reset email sent to $email");
      return true;
    } catch (e) {
      debugPrint("Error sending password reset email: $e");
      return false;
      // Handle the error here
    }
  }

  Future<bool> isUserLoggedIn() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    return user != null;
  }

  Future<void> signOut() async {

    /// try to log out of firebase
    try{
      FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.signOut();
    }catch(e) {
      debugPrint("$e");
    }

  }

  static bool userExists() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    if (user != null) {
      // User is logged in
      debugPrint('User is already logged in: ${user.email}');
      return true;
    } else {
      // User is not logged in
      debugPrint('No user is currently logged in.');
      return false;
    }
  }

  static Future<bool> deleteUser() async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      // await _auth.signOut();
      await _auth.currentUser!.delete();
      debugPrint("user successfuly deleted");
      return true;
    }catch(e) {
      debugPrint("$e");
      debugPrint("failed to delete user");
      return false;
    }

  }

}

