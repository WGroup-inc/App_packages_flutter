import 'package:app_core/app_options.dart';
import 'package:flutter/material.dart';

import './resources/app_localizations.dart';

class OnboardingApp extends StatelessWidget {
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
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppLocalizations.of(context).hello),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        child: Text('Vietnamese'),
                        onPressed: () {
                          AppOptions.update(
                            context,
                            AppOptions.of(context).copyWith(
                              locale: Locale('vi'),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                      ),
                      RaisedButton(
                        child: Text('English'),
                        onPressed: () {
                          AppOptions.update(
                            context,
                            AppOptions.of(context).copyWith(
                              locale: Locale('en'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.login),
              onPressed: () {
                AppOptions.update(
                  context,
                  AppOptions.of(context).copyWith(
                    authenticationStatus:
                        AuthenticationStatus.signedIn(user: User()),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
