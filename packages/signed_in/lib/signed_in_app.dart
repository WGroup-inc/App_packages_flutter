import 'package:flutter/material.dart';
import 'package:app_core/app_options.dart';

class SignedInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Signed In'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.logout),
          onPressed: () {
            AppOptions.update(
              context,
              AppOptions.of(context).copyWith(authenticationStatus: AuthenticationStatus.notSignedIn()),
            );
          },
        ),
      ),
    );;
  }
}