import 'package:app_core/app_options.dart';
import 'package:flutter/material.dart';

import 'resources/app_localizations.dart';

class SignedInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates
      ],
      locale: AppOptions.of(context).locale,
      localeResolutionCallback: (locale, supportedLocales) {
        return locale;
      },
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Text(AppLocalizations.of(context).signedIn),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.logout),
            onPressed: () {
              AppOptions.update(
                context,
                AppOptions.of(context).copyWith(
                    authenticationStatus: AuthenticationStatus.notSignedIn()),
              );
            },
          ),
        );
      }),
    );
    ;
  }
}
