part of '../flexify.dart';

/// FlexifyNavigator handles navigation operations with optional animations.
class FlexifyNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void _navigate(
    Widget page, {
    FlexifyRouteAnimations? animation,
    Duration? animationDuration,
    bool replace = false,
    bool removeUntil = false,
  }) {
    assert(
      animation == null || animationDuration != null,
      'Duration must be provided when using a custom animation',
    );

    final context = navigatorKey.currentState?.overlay?.context;

    if (context == null) {
      throw FlutterError('Navigator context is not available.');
    }

    Route route = _getRoute(context, page, animation, animationDuration);

    if (replace) {
      if (removeUntil) {
        navigatorKey.currentState?.pushAndRemoveUntil(route, (route) => false);
      } else {
        navigatorKey.currentState?.pushReplacement(route);
      }
    } else {
      navigatorKey.currentState?.push(route);
    }
  }

  static Route _getRoute(BuildContext context, Widget page,
      FlexifyRouteAnimations? animation, Duration? duration) {
    if (animation == null) {
      return _getPlatformRoute(context, page);
    } else {
      return FlexifyRouteAnimationBuilder.build(
          context, page, animation, duration!);
    }
  }

  static Route _getPlatformRoute(BuildContext context, Widget page) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoPageRoute(builder: (_) => page);
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return MaterialPageRoute(builder: (_) => page);
    } else {
      // Default to MaterialPageRoute for other platforms
      return MaterialPageRoute(builder: (_) => page);
    }
  }

  /// Navigate to a new screen.
  static void go(Widget page,
      {FlexifyRouteAnimations? animation, Duration? animationDuration}) {
    _navigate(page, animation: animation, animationDuration: animationDuration);
  }

  /// Navigate to a new screen and remove the current screen.
  static void goRemove(Widget page,
      {FlexifyRouteAnimations? animation, Duration? animationDuration}) {
    _navigate(page,
        animation: animation,
        animationDuration: animationDuration,
        replace: true);
  }

  /// Navigate to a new screen and remove all previous screens.
  static void goRemoveAll(Widget page,
      {FlexifyRouteAnimations? animation, Duration? animationDuration}) {
    _navigate(page,
        animation: animation,
        animationDuration: animationDuration,
        replace: true,
        removeUntil: true);
  }

  /// Navigate back to the previous screen.
  static void back() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    } else {
      // Do nothing if there's no page to pop
      debugPrint('No previous page to pop.');
    }
  }
}
