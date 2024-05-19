part of '../flexify.dart';

/// FlexifyContext is an InheritedWidget that provides access to the current BuildContext.
class FlexifyContext extends InheritedWidget {
  final BuildContext context;

  const FlexifyContext({
    super.key,
    required this.context,
    required super.child,
  });

  /// Retrieves the nearest FlexifyContext instance.
  static FlexifyContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlexifyContext>();
  }

  @override
  bool updateShouldNotify(FlexifyContext oldWidget) {
    return context != oldWidget.context;
  }
}
