import 'package:flutter/material.dart';
import 'package:flutter_design_extension/src/design_tokens/colors/brands/brand_color_tokens.dart';
import 'package:flutter_design_extension/src/design_tokens/design_token_theme_extension.dart';
import 'package:flutter_design_extension/src/localisation/app_design_provider.dart';
import 'package:flutter_design_extension/src/localisation/localize.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class FlutterDesignApp extends StatefulWidget {
  final List<Localize> languages;
  final String langugePath;
  final ThemeMode mode;
  final Widget Function(
    Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Iterable<Locale> supportedLocales,
    Locale locale,
    ThemeData theme,
  ) materialApp;
  final Brand defaultBrand;
  FlutterDesignApp({
    required this.materialApp,
    Brand? brand,
    this.langugePath = "assets/languages",
    this.languages = const [],
    this.mode = ThemeMode.system,
    super.key,
  }) : defaultBrand = (brand == null) ? DefaultBrand() : brand;

  @override
  State<FlutterDesignApp> createState() => _FlutterDesignAppState();
}

class _FlutterDesignAppState extends State<FlutterDesignApp> {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = [widget.langugePath];
    return Builder(
      builder: (context) => ChangeNotifierProvider(
        create: (context) =>
            AppDesign(widget.languages, widget.defaultBrand, widget.mode),
        builder: (BuildContext context, Widget? child) {
          final design = context.appDesign;
          final Iterable<LocalizationsDelegate<dynamic>>
              localizationsDelegates = [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            LocalJsonLocalization.delegate,
          ];
          final Iterable<Locale> supportedLocales = design.supportedLocales;
          final Locale locale = design.lang;
          final ThemeData theme = ThemeData(
            tabBarTheme: TabBarTheme(
              labelColor:
                  design.brand.getColorTokens(design.isDarkMode).brand.main,
              unselectedLabelColor: design.brand
                  .getColorTokens(design.isDarkMode)
                  .brand
                  .secondary,
            ),
            extensions: [
              DesignTokensThemeExtension.initWithBrandAndTextDirection(
                brand: design.brand,
                textDirection: design.textDirection,
                isDarkMode: design.isDarkMode,
              ),
            ],
          );
          final Locale? Function(Locale?, Iterable<Locale>)
              // ignore: prefer_function_declarations_over_variables
              localeResolutionCallback = (locale, supportedLocales) {
            if (supportedLocales.contains(locale)) {
              return locale;
            }
            return design.lang;
          };
          return widget.materialApp(
            localeResolutionCallback,
            localizationsDelegates,
            supportedLocales,
            locale,
            theme,
          );
        },
      ),
    );
  }
}
