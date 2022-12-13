const double _kIconSizeXSmall = 12;
const double _kIconSizeSmall = 16;
const double _kIconSizeMedium = 20;
const double _kIconSizeLarge = 24;

enum DesignIconSize {
  xSmall(size: _kIconSizeXSmall),
  small(size: _kIconSizeSmall),
  medium(size: _kIconSizeMedium),
  large(size: _kIconSizeLarge);

  final double size;
  const DesignIconSize({required this.size});
}
