import 'dart:ui';

import 'package:localization/localization.dart';

class Localize {
  final String langSymbol;
  final String countrySymbol;
  final TextDirection textDirection;

  Localize({
    required this.langSymbol,
    required this.countrySymbol,
    required this.textDirection,
  });
}

extension LocalizationString on String {
  String locale() {
    return i18n();
  }
}
