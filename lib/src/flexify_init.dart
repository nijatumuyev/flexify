part of '/flexify.dart';

/// FlexifyInit is a class that initializes and provides
/// responsive scaling utilities.
class FlexifyInit {
  static FlexifyInit? _instance;

  late double _designWidth;
  late double _designHeight;
  BuildContext? _context;

  FlexifyInit._internal();

  /// Returns the single instance of the FlexifyInit class.
  ///
  /// This instance is lazily initialized.
  static FlexifyInit get instance {
    _instance ??= FlexifyInit._internal();
    return _instance!;
  }

  /// Initializes the Flexify with design dimensions and context.
  ///
  /// The [designWidth] and [designHeight] parameters represent the base dimensions
  /// for scaling the UI elements. The [context] is used to obtain the current screen
  /// size and other properties.
  ///
  /// Throws an [AssertionError] if any of the parameters are invalid.
  void init({
    required double designWidth,
    required double designHeight,
    required BuildContext context,
  }) {
    if (designWidth <= 0 || designHeight <= 0) {
      throw AssertionError(
          'Design width and height must be greater than zero.');
    }

    _designWidth = designWidth;
    _designHeight = designHeight;
    _context = context;
  }

  /// Returns the current BuildContext.
  ///
  /// Throws a [FlutterError] if the context is not initialized.
  BuildContext? get context => _context;

  MediaQueryData get _mediaQueryData {
    if (context == null) {
      throw FlutterError('FlexifyInit context is not initialized.');
    }
    return MediaQuery.of(context!);
  }

  /// The scaling factor based on the design width.
  double get scaleWidth => _mediaQueryData.size.width / _designWidth;

  /// The scaling factor based on the design height.
  double get scaleHeight => _mediaQueryData.size.height / _designHeight;

  /// Returns the scaled width based on the design width.
  double setWidth(num width) {
    if (width < 0) {
      throw ArgumentError('Width cannot be negative.');
    }
    return width * scaleWidth;
  }

  /// Returns the scaled height based on the design height.
  double setHeight(num height) {
    if (height < 0) {
      throw ArgumentError('Height cannot be negative.');
    }
    return height * scaleHeight;
  }

  /// Returns the resolved font size based on the minimum scaling factor.
  double setRt(num fontSize) {
    if (fontSize < 0) {
      throw ArgumentError('Font size cannot be negative.');
    }
    return fontSize * min(scaleWidth, scaleHeight);
  }
}
