import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:provider/provider.dart';

class AppDesign with ChangeNotifier {
  final List<Localize> _languages;
  Brand _brand;

  AppDesign(this._languages, this._brand);

  ThemeMode themeMode = ThemeMode.system;
  Localize? _lang;

  Brand get brand {
    return _brand;
  }

  Locale get lang {
    return _lang == null
        ? const Locale("en", "US")
        : Locale(_lang!.langSymbol, _lang!.countrySymbol);
  }

  TextDirection get textDirection {
    return _lang == null ? TextDirection.ltr : _lang!.textDirection;
  }

  List<Locale> get supportedLocales {
    return _languages.isEmpty
        ? const [Locale("en", "US")]
        : _languages.map((e) => Locale(e.langSymbol, e.countrySymbol)).toList();
  }

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  Localize? get currentLang {
    return _lang;
  }

  void toggleTheme() {
    themeMode = !isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setThemeLanguage(Localize lang) {
    _lang = lang;
    notifyListeners();
  }

  void updateBrand(Brand brand) {
    _brand = brand;
    notifyListeners();
  }

  void reloadWidgets() {
    notifyListeners();
  }
}

extension AppDesignProvider on BuildContext {
  AppDesign get appDesignForAction {
    return Provider.of<AppDesign>(this, listen: false);
  }

  AppDesign get appDesign {
    return Provider.of<AppDesign>(this);
  }
}
