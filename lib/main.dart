import 'package:app_core/app_options.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding_app.dart';
import 'package:signed_in/signed_in_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppOptionsBinding(
      initialOptions: AppOptions(
        locale: Locale('en'),
        authenticationStatus: AuthenticationStatus.notSignedIn(),
      ),
      child: Builder(
        builder: (context) {
          return AppOptions.of(context).authenticationStatus.isSignedIn
              ? SignedInApp()
              : OnboardingApp();
        },
      ),
    );
  }
}
