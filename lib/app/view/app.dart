import 'package:flutter/material.dart';
import 'package:wikigu/app/not_found_page.dart';
import 'package:wikigu/counter/counter.dart';
import 'package:wikigu/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  ThemeData themeData(BuildContext context) => ThemeData(
        brightness: Theme.of(context).brightness,
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        final pushId = settings.arguments as String?;
        switch (settings.name) {
          case '/newPage':
            return CounterPage.route();
          case '/':
            return CounterPage.route();
          default:
            return NotFountPage.route();
        }
      },
      theme: themeData(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
