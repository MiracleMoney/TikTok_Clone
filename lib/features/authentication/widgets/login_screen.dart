import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone2/constants/gaps.dart';
import 'package:tiktok_clone2/constants/sizes.dart';
import 'package:tiktok_clone2/features/authentication/widgets/login_form_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/sign_up_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone2/utils.dart';

class LoginScreen extends StatelessWidget {
  static String routeURL = "/";
  static String routeName = "/login";

  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.pop(context);
  }

  void _onEmailLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginFormSceen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "Log in to TikTok",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Opacity(
                opacity: 0.7,
                child: Text(
                  "Manage your account, check notifications, comment on videos, and more.",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => _onEmailLoginTap(context),
                child: const AuthButton(
                    icon: FaIcon(
                      FontAwesomeIcons.user,
                    ),
                    text: "Use email & password"),
              ),
              Gaps.v16,
              const AuthButton(
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                  ),
                  text: "Continue with Apple"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: isDarkMode(context) ? null : Colors.grey.shade50,
        child: Padding(
          padding: const EdgeInsets.only(
            top: Sizes.size32,
            bottom: Sizes.size64,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: Sizes.size14,
                  ),
                ),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onSignUpTap(context),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
