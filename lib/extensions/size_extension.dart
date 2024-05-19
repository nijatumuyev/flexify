part of '../flexify.dart';

/// An extension on num to provide responsive scaling utilities.
extension ResponsiveScale on num {
  /// Returns the minimum of the responsive width and height.
  double get rs => min(rw, rh);

  /// Returns the responsive width.
  double get rw => FlexifyInit.instance.setWidth(this);

  /// Returns the responsive height.
  double get rh => FlexifyInit.instance.setHeight(this);

  /// Returns the responsive font size.
  double get rt => FlexifyInit.instance.setRt(this);
}
