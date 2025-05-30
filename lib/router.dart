import 'package:go_router/go_router.dart';
import 'package:tiktok_clone2/features/authentication/widgets/email_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/login_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/sign_up_screen.dart';
import 'package:tiktok_clone2/features/authentication/widgets/username_screen.dart';
import 'package:tiktok_clone2/features/users/user_profile_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: UsernameScreen.routeName,
      builder: (context, state) => const UsernameScreen(),
    ),
    GoRoute(
      path: EmailScreen.routeName,
      builder: (context, state) => const EmailScreen(),
    ),
    GoRoute(
      path: "/users/:username",
      builder: (context, state) {
        final username = state.params['username'];
        print(state.params);
        final tab = state.queryParams["show"];
        return UserProfileScreen(username: username!, tab: tab!);
      },
    )
  ],
);
