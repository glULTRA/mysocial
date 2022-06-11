import 'package:firebase_auth/firebase_auth.dart';
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
  // <---------SignIn--------->
  // Sign in with email/username and password.
  Future signInWithEmailAndPassword({
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

  // Sign out.
  Future signOut() async {
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
