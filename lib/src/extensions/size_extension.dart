part of '/flexify.dart';

/// An extension on num to provide responsive scaling utilities.
extension ResponsiveScale on num {
  /// Returns the minimum of the responsive width and height.
  double get rs {
    try {
      return min(rw, rh);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Returns the responsive width.
  double get rw {
    try {
      return FlexifyInit.instance.setWidth(this);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Returns the responsive height.
  double get rh {
    try {
      return FlexifyInit.instance.setHeight(this);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Returns the responsive font size.
  double get rt {
    try {
      return FlexifyInit.instance.setRt(this);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(dynamic error) {
    debugPrint('ResponsiveScale encountered an error: $error');
  }

  /// Returns a SizedBox with responsive height.
  SizedBox get verticalSpace {
    return SizedBox(height: rh);
  }

  /// Returns a SizedBox with responsive width.
  SizedBox get horizontalSpace {
    return SizedBox(width: rw);
  }
}
