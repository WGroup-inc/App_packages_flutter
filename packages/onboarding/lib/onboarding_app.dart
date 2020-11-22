import 'package:flutter/material.dart';
import 'package:app_core/app_options.dart';

class OnboardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Onboarding'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.login),
          onPressed: () {
            AppOptions.update(
              context,
              AppOptions.of(context).copyWith(authenticationStatus: AuthenticationStatus.signedIn(user: User())),
            );
          },
        ),
      ),
    );
  }
}
