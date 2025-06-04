import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone2/constants/gaps.dart';
import 'package:tiktok_clone2/constants/sizes.dart';
import 'package:tiktok_clone2/features/authentication/widgets/username_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/login_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone2/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String routeURL = "/";
  static String routeName = "signUp";

  void _onLoginTap(BuildContext context) async {
    context.push(LoginScreen.routeName);
  }

  void _onEmailTap(BuildContext context) {
    // Navigator.of(context).push(
    //   PageRouteBuilder(
    //       transitionDuration: const Duration(seconds: 1),
    //       reverseTransitionDuration: const Duration(seconds: 1),
    //       pageBuilder: (context, animation, secondaryAnimation) =>
    //           const UsernameScreen(),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         final offsetAnimation = Tween(
    //           begin: const Offset(0, -1),
    //           end: Offset.zero,
    //         ).animate(animation);
    //         final opacityAnimation = Tween(
    //           begin: 0.5,
    //           end: 1.0,
    //         ).animate(animation);
    //         return SlideTransition(
    //           position: offsetAnimation,
    //           child: FadeTransition(
    //             opacity: opacityAnimation,
    //             child: child,
    //           ),
    //         );
    //       }),
    // );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        print(orientation);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(
                children: [
                  Gaps.v80,
                  const Text(
                    "Sign up for TikTok",
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  const Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Creat a profile, follow other accounts, make your own videos, and more.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
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
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onEmailTap(context),
                            child: const AuthButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.user,
                                ),
                                text: "Use email & password"),
                          ),
                        ),
                        Gaps.h16,
                        const Expanded(
                          child: AuthButton(
                              icon: FaIcon(
                                FontAwesomeIcons.apple,
                              ),
                              text: "Continue with Apple"),
                        ),
                      ],
                    )
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
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: Sizes.size14,
                      ),
                    ),
                    Gaps.h5,
                    GestureDetector(
                      onTap: () => _onLoginTap(context),
                      child: Text(
                        "Log in",
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
      },
    );
  }
}
