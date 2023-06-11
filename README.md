## **SETUP STEP**
1. Create a App Brand ```extends Brand```
  ```
class AppBrand extends Brand {
  @override
  ColorTokens getColorTokens(bool isDarkMode) {
    return ColorTokens(
      brand: ColorBrand(
        main: isDarkMode ? const Color(0xFFEBEAEE) : const Color(0xFF1D1C1C),
        dark: isDarkMode ? const Color(0xFFEBEAEE) : const Color(0xFF003366),
        secondary: isDarkMode ? Colors.white24 : Colors.black26,
        background:
            isDarkMode ? const Color(0xFF1D1C1C) : const Color(0xFFEBEAEE),
      ),
      interaction: ColorInteraction(
        main: isDarkMode ? const Color(0xFFEBEAEE) : const Color(0xFF1D1C1C),
        hover: isDarkMode
            ? Colors.white24.withOpacity(0.5)
            : const Color(0xFF003366).withOpacity(0.5),
        pressed: isDarkMode ? Colors.white24 : const Color(0xFF003366),
      ),
      neutral: isDarkMode ? ColorNeutralDark() : ColorNeutralLight(),
      messaging: isDarkMode ? ColorMessagingDark() : ColorMessagingLight(),
    );
  }
}
```
2.  Start ```FlutterDesignApp``` Widget inside RunApp
  ```
  runApp(FlutterDesignApp(
            brand: AppBrand(),
            materialApp: (
              localeResolutionCallback,
              localizationsDelegates,
              supportedLocales,
              locale,
              theme,
            ) {
              return MaterialApp(
                localeResolutionCallback: localeResolutionCallback,
                localizationsDelegates: localizationsDelegates,
                supportedLocales: supportedLocales,
                locale: locale,
                theme: theme,
                builder: (context, child) => const YourAppHomeScreen(),
              );
            },
          ),
          );
  ```
3. Don't forget to add `en_US.json` file inside `assets/languages`

## `DesignTokensThemeExtension` 
it supports the
  ```
   final TextDirection textDirection;
   final ColorTokens colors;
   final ElevationTokens elevations;
   final SpacingTokens spacings;
   final OpacityTokens opacities;
   final BorderRadiusTokens borderRadiuses;
   final TextStyleTokens textStyles;
   final IconTokens icons;
  ```
  1. It is used by using `context.theme` inside build method
  
  ##  `AppDesignProvider`
          It is used to find application design system and toggle dark, and light themes. It is also used for toggle languages.
  1. use `context.appDesignForAction` for action
  2. use `context.appDesign` for design
  3. use `toggleTheme()` to toggle your dark and light theme
  4. use `setThemeLanguage(Localize lang)` to update your app language
  5. use `updateBrand(Brand brand)` to update your brand
  6. use `isDarkMode` to get your current theme mode
  7. use `supportedLocales` to get your app supported locales (languages)
  8. use `textDirection` to get your current text direction
  9. use `lang` to get your current app language
  10. use `brand` to get your current app brand
  
