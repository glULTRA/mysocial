import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mysocial/models/user.dart';

class AuthService {
  // Firbase authentication object.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User instance
  MegaUser? _userFromFireBase(User? user) {
    // if user is not null we gonna make a new user within it's id.
    return user != null ? MegaUser(uid: user.uid) : null;
  }

  // Authentication change user stream.
  Stream<MegaUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFireBase(user));
  }

  // <---------Register--------->
  // Email & password Register.
  Future registerWithEmailAndPassword({
    required String email,
    required String password,
    String? username,
    String? fullname,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Get a user
      User? user = result.user;
      // Add username/fullname to database.
      // ....
      // Return Mega User id.
      return _userFromFireBase(user);
    } catch (e) {
      print("Error::Register::Email/Password::$e");
      return null;
    }
  }

  // Facebool Register.
  // Github Register.

  Future signInWithGitHub(BuildContext context) async {
    try {} catch (e) {}
  }

  // <---------SignIn--------->
  // Sign in with email/username and password.
  Future<MegaUser?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFireBase(user!);
    } catch (e) {
      print("Error::SignIn::Email/Password::$e");
      return null;
    }
  }

  // Sign in with Facebook.
  // Sign in with Github.
  // Sign in with Gmail.
  Future signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential result =
          await _auth.signInWithCredential(credential);

      // Once signed in, return the UserCredential

      return _userFromFireBase(result.user);
    } catch (e) {
      print("Error::Register::Google::$e");
      throw MissingPluginException("What");
    }
  }
  // Future signInWithGithub() async {
  //   try {
  //     String accessToken = '...'; // From 3rd party provider
  //     var githubAuthCredential = GithubAuthProvider.credential(accessToken);

  //     return await FirebaseAuth.instance
  //         .signInWithCredential(githubAuthCredential);
  //   } catch (e) {
  //     print("Error::Login::Github::$e");

  //     return null;
  //   }
  // }

  // Sign out.
  Future signOut() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
      print('do go after this ?');
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  // Sign out.
  Future signOutGoogle() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  // Check if user is exist.
  //Bool isUsernameExist(String username) async {
  //  try {
  // We should check from database later
  //    return false;
  //  } catch (e) {
  //    return false;
  //  }
  //}
}
