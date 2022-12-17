import 'package:flutter/material.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter_design_extension/src/localisation/app_design_provider.dart';
import 'package:flutter_design_extension/src/localisation/localize.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class FlutterDesignApp extends StatefulWidget {
  final List<Localize> languages;
  final String langugePath;
  final Widget? home;

  const FlutterDesignApp({
    this.home,
    this.langugePath = "assets/languages",
    this.languages = const [],
    super.key,
  });

  @override
  State<FlutterDesignApp> createState() => _FlutterDesignAppState();
}

class _FlutterDesignAppState extends State<FlutterDesignApp> {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = [widget.langugePath];
    return Builder(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AppDesign(widget.languages),
        builder: (BuildContext context, Widget? child) {
          final design = context.read<AppDesign>();
          return MaterialApp(
            locale: design.lang,
            localeResolutionCallback: (locale, supportedLocales) {
              if (supportedLocales.contains(locale)) {
                return locale;
              }
              return design.lang;
            },
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              LocalJsonLocalization.delegate,
            ],
            supportedLocales: design.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              extensions: [
                DesignTokensThemeExtension.initWithBrandAndTextDirection(
                  brand: design.brand,
                  textDirection: design.textDirection,
                  isDarkMode: design.isDarkMode,
                ),
              ],
            ),
            home: widget.home,
          );
        },
      ),
    );
  }
}
