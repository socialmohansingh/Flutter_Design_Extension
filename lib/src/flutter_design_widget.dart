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
  final Widget? home;
  final Brand defaultBrand;
  final GlobalKey<NavigatorState>? navigatorKey;

  FlutterDesignApp({
    this.home,
    Brand? brand,
    this.langugePath = "assets/languages",
    this.languages = const [],
    this.navigatorKey,
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
        create: (context) => AppDesign(widget.languages, widget.defaultBrand),
        builder: (BuildContext context, Widget? child) {
          final design = context.appDesign;
          return MaterialApp(
            locale: design.lang,
            navigatorKey: widget.navigatorKey,
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
            ),
            home: widget.home,
          );
        },
      ),
    );
  }
}
