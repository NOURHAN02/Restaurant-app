import 'package:firebase_auth/firebase_auth.dart';

class NetworkErrors {
  final String networkError;

  NetworkErrors({required this.networkError});

  factory NetworkErrors.fromFirebase(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return NetworkErrors(
          networkError: "The email address is badly formatted.",
        );
      case 'user-disabled':
        return NetworkErrors(networkError: "This user has been disabled.");
      case 'user-not-found':
        return NetworkErrors(networkError: "No user found for that email.");
      case 'wrong-password':
        return NetworkErrors(networkError: "Wrong password provided.");
      case 'email-already-in-use':
        return NetworkErrors(networkError: "The email is already in use.");
      case 'operation-not-allowed':
        return NetworkErrors(networkError: "This operation is not allowed.");
      case 'weak-password':
        return NetworkErrors(networkError: "The password is too weak.");
      case 'too-many-requests':
        return NetworkErrors(
          networkError: "Too many attempts. Try again later.",
        );
      case 'network-request-failed':
        return NetworkErrors(
          networkError: "Network error. Check your connection.",
        );
      case 'internal-error':
        return NetworkErrors(networkError: "An internal error occurred.");
      case 'requires-recent-login':
        return NetworkErrors(
          networkError: "Please re-authenticate to continue.",
        );
      case 'invalid-credential':
        return NetworkErrors(
          networkError: "The credential is invalid or expired.",
        );
      case 'invalid-verification-code':
        return NetworkErrors(networkError: "The verification code is invalid.");
      case 'invalid-verification-id':
        return NetworkErrors(networkError: "The verification ID is invalid.");
      case 'credential-already-in-use':
        return NetworkErrors(
          networkError: "This credential is already in use.",
        );
      case 'account-exists-with-different-credential':
        return NetworkErrors(
          networkError: "Account exists with a different sign-in method.",
        );
      default:
        return NetworkErrors(
          networkError: "Something went wrong. Please try again.",
        );
    }
  }
}
