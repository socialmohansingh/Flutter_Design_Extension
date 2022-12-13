const double _kBtnSmallHeight = 32;
const double _kBtnMediumHeight = 40;
const double _kBtnLargeHeight = 48;

/// Design button size variations with specified height values.
enum DesignButtonSize {
  small(height: _kBtnSmallHeight),
  medium(height: _kBtnMediumHeight),
  large(height: _kBtnLargeHeight);

  final double height;
  const DesignButtonSize({required this.height});
}
