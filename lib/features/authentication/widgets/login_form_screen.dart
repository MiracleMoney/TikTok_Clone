import 'package:flutter/material.dart';
import 'package:tiktok_clone2/constants/gaps.dart';
import 'package:tiktok_clone2/constants/sizes.dart';
import 'package:tiktok_clone2/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone2/features/onboarding/interests_screen.dart';

class LoginFormSceen extends StatefulWidget {
  const LoginFormSceen({super.key});

  @override
  State<LoginFormSceen> createState() => _LoginFormSceenState();
}

class _LoginFormSceenState extends State<LoginFormSceen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gaps.v28,
                TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['email'] = newValue;
                      }
                    }),
                Gaps.v16,
                TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['password'] = newValue;
                      }
                    }),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmitTap,
                  child: const FormButton(
                    disabled: false,
                    text: "Log in",
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
