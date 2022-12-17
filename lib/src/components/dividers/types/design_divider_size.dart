const double _dividerSmallHeight = 1;
const double _dividerMediumHeight = 8;
const double _dividerLargeHeight = 16;

/// design Divider with 3 size variations, small (1dp), medium (8dp) & large (16dp).
enum DesignDividerSize {
  /// Enum 'small' used for divider when required divider size is 1dp
  small(height: _dividerSmallHeight),

  /// Enum 'medium' used for divider when required divider size is 8dp
  medium(height: _dividerMediumHeight),

  /// Enum 'large' used for divider when required divider size is 16dp
  large(height: _dividerLargeHeight);

  final double height;

  const DesignDividerSize({
    required this.height,
  });
}
