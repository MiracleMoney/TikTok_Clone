import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Sign up for TikTok"),
            Text(
                "Creat a profile, follow other accounts, make your own videos, and more.")
          ],
        ),
      ),
    );
  }
}
