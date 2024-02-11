import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;

  // Constructor taking an instance of FirebaseAuth
  AuthenticationProvider(this.firebaseAuth);

  // Stream to listen to changes in the authentication state
  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  // Method to sign out the current user
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // Method to sign in with email and password
  Future<String?> signIn(String email, String password) async {
    try {
      // Attempt to sign in using provided email and password
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in"; // Return success message if successful
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message if sign-in fails
    }
  }

  // Method to sign up with email and password
  Future<String?> signUp(String email, String password) async {
    try {
      // Attempt to create a new user with provided email and password
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up"; // Return success message if successful
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message if sign-up fails
    }
  }

  // Method to get the unique identifier (UID) of the current user
  Future<String?> uid() async {
    return firebaseAuth.currentUser?.uid;
  }
  
}
