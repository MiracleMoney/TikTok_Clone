import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone2/features/authentication/widgets/email_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/login_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/sign_up_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/username_screen.dart';
import 'package:tiktok_clone2/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone2/features/users/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeURL,
      name: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: InterestsScreen.routeURL,
      name: InterestsScreen.routeName,
      builder: (context, state) => const InterestsScreen(),
    )
  ],
);
