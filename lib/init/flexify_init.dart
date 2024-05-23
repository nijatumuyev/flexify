part of '../flexify.dart';

/// FlexifyInit is a singleton class that initializes and provides
/// responsive scaling utilities.
class FlexifyInit {
  static final FlexifyInit _instance = FlexifyInit._internal();
  static FlexifyInit get instance => _instance;

  late double _designWidth;
  late double _designHeight;
  BuildContext? _context;

  FlexifyInit._internal();

  /// Initializes the Flexify with design dimensions and context.
  static void init({
    required double designWidth,
    required double designHeight,
    required BuildContext context,
  }) {
    _instance._designWidth = designWidth;
    _instance._designHeight = designHeight;
    _instance._context = context;
  }

  /// Returns the current BuildContext.
  static BuildContext? get context => _instance._context;

  MediaQueryData get _mediaQueryData {
    if (context == null) {
      throw FlutterError('FlexifyInit context is not initialized.');
    }
    return MediaQuery.of(context!);
  }

  double get scaleWidth => _mediaQueryData.size.width / _designWidth;
  double get scaleHeight => _mediaQueryData.size.height / _designHeight;

  /// Returns the scaled width based on the design width.
  double setWidth(num width) => width * scaleWidth;

  /// Returns the scaled height based on the design height.
  double setHeight(num height) => height * scaleHeight;

  /// Returns the resolved font size.
  double setRt(num fontSize) => fontSize * min(scaleWidth, scaleHeight);
}
