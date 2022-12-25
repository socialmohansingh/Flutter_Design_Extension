import 'dart:ui';

class ColorBrand {
  final Color main;
  final Color? background;
  final Color dark;
  final Color secondary;

  ColorBrand({
    required this.main,
    required this.dark,
    required this.secondary,
    this.background,
  });

  ColorBrand lerp(ColorBrand? other, double t) {
    return ColorBrand(
      dark: Color.lerp(dark, other?.dark, t)!,
      main: Color.lerp(main, other?.main, t)!,
      secondary: Color.lerp(secondary, other?.secondary, t)!,
    );
  }
}
