import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/screens/auth/sign_in/sign_in_screen.dart';

@RoutePage<UserCredential>()
class SignInPage extends StatelessWidget {
  final void Function(UserCredential) onComplete;

  const SignInPage({
    super.key,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return SignInScreen(onComplete: onComplete);
  }
}
