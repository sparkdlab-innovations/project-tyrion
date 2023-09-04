import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tyrion/src/utils/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        resolver.next(true);
        return;
      }

      GoogleSignInAccount? googleSignInAccount;
      GoogleSignInAuthentication? googleSignInAuthentication;

      if ((await GoogleSignIn().isSignedIn()) == true) {
        googleSignInAuthentication =
            await GoogleSignIn().currentUser?.authentication;
      }

      if (googleSignInAuthentication == null) {
        googleSignInAccount =
            await GoogleSignIn().signInSilently(suppressErrors: true);
        googleSignInAuthentication = await googleSignInAccount?.authentication;
      }

      if (googleSignInAccount != null && googleSignInAuthentication != null) {
        OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
        resolver.next(true);
        return;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    resolver.redirect(SignInRoute(
      onComplete: (userCredential) {
        resolver.next(true);
      },
    ));
  }
}
