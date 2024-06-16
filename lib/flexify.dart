library flexify;

import 'dart:math' show min, pi;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'src/flexify_init.dart';
part 'src/extensions/size_extension.dart';
part 'src/flexify_navigator.dart';
part 'src/flexify_route_animation_builder.dart';

/// Flexify is a widget that helps in making the UI responsive to different screen sizes.
class Flexify extends StatefulWidget {
  /// The design width of the application.
  final double designWidth;

  /// The design height of the application.
  final double designHeight;

  /// The main application widget.
  final Widget app;

  /// A global key for accessing the Flexify state.
  static final globalKey = GlobalKey<_FlexifyState>();

  /// Creates a Flexify widget.
  ///
  /// The [designWidth] and [designHeight] parameters are used as the base dimensions
  /// for scaling the UI elements.
  const Flexify({
    super.key,
    required this.designWidth,
    required this.designHeight,
    required this.app,
  });

  /// Navigate to a new screen.
  static void go(Widget page,
      {FlexifyRouteAnimations? animation, Duration? animationDuration}) {
    FlexifyNavigator.go(page,
        animation: animation, animationDuration: animationDuration);
  }

  /// Navigate to a new screen and remove the current screen.
  static void goRemove(Widget page,
      {FlexifyRouteAnimations? animation, Duration? duration}) {
    FlexifyNavigator.goRemove(page,
        animation: animation, animationDuration: duration);
  }

  /// Navigate to a new screen and remove all previous screens.
  static void goRemoveAll(Widget page,
      {FlexifyRouteAnimations? animation, Duration? duration}) {
    FlexifyNavigator.goRemoveAll(page,
        animation: animation, animationDuration: duration);
  }

  /// Navigate back to the previous screen.
  static void back() {
    FlexifyNavigator.back();
  }

  @override
  State<Flexify> createState() => _FlexifyState();
}

/// The state class for the Flexify widget.
class _FlexifyState extends State<Flexify> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FlexifyInit.instance.init(
      designWidth: widget.designWidth,
      designHeight: widget.designHeight,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithNavigatorKey(widget.app);
  }

  Widget wrapWithNavigatorKey(Widget app) {
    if (app is MaterialApp) {
      return MaterialApp(
        navigatorKey: FlexifyNavigator.navigatorKey,
        home: app.home,
        actions: app.actions,
        key: app.key,
        onNavigationNotification: app.onNavigationNotification,
        restorationScopeId: app.restorationScopeId,
        scaffoldMessengerKey: app.scaffoldMessengerKey,
        scrollBehavior: app.scrollBehavior,
        shortcuts: app.shortcuts,
        themeAnimationCurve: app.themeAnimationCurve,
        themeAnimationDuration: app.themeAnimationDuration,
        themeAnimationStyle: app.themeAnimationStyle,
        routes: app.routes!,
        initialRoute: app.initialRoute,
        onGenerateRoute: app.onGenerateRoute,
        onGenerateInitialRoutes: app.onGenerateInitialRoutes,
        onUnknownRoute: app.onUnknownRoute,
        navigatorObservers: app.navigatorObservers!,
        builder: app.builder,
        title: app.title,
        onGenerateTitle: app.onGenerateTitle,
        color: app.color,
        theme: app.theme,
        darkTheme: app.darkTheme,
        highContrastTheme: app.highContrastTheme,
        highContrastDarkTheme: app.highContrastDarkTheme,
        themeMode: app.themeMode,
        locale: app.locale,
        localizationsDelegates: app.localizationsDelegates,
        localeListResolutionCallback: app.localeListResolutionCallback,
        localeResolutionCallback: app.localeResolutionCallback,
        supportedLocales: app.supportedLocales,
        debugShowMaterialGrid: app.debugShowMaterialGrid,
        showPerformanceOverlay: app.showPerformanceOverlay,
        checkerboardRasterCacheImages: app.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: app.checkerboardOffscreenLayers,
        showSemanticsDebugger: app.showSemanticsDebugger,
        debugShowCheckedModeBanner: app.debugShowCheckedModeBanner,
      );
    } else if (app is CupertinoApp) {
      return CupertinoApp(
        navigatorKey: FlexifyNavigator.navigatorKey,
        home: app.home,
        actions: app.actions,
        checkerboardOffscreenLayers: app.checkerboardOffscreenLayers,
        checkerboardRasterCacheImages: app.checkerboardRasterCacheImages,
        key: app.key,
        onNavigationNotification: app.onNavigationNotification,
        restorationScopeId: app.restorationScopeId,
        scrollBehavior: app.scrollBehavior,
        shortcuts: app.shortcuts,
        showPerformanceOverlay: app.showPerformanceOverlay,
        showSemanticsDebugger: app.showSemanticsDebugger,
        routes: app.routes!,
        initialRoute: app.initialRoute,
        onGenerateRoute: app.onGenerateRoute,
        onGenerateInitialRoutes: app.onGenerateInitialRoutes,
        onUnknownRoute: app.onUnknownRoute,
        navigatorObservers: app.navigatorObservers!,
        builder: app.builder,
        title: app.title,
        onGenerateTitle: app.onGenerateTitle,
        color: app.color,
        theme: app.theme,
        locale: app.locale,
        localizationsDelegates: app.localizationsDelegates,
        localeListResolutionCallback: app.localeListResolutionCallback,
        localeResolutionCallback: app.localeResolutionCallback,
        supportedLocales: app.supportedLocales,
        debugShowCheckedModeBanner: app.debugShowCheckedModeBanner,
      );
    } else {
      throw FlutterError('Unsupported app type: ${app.runtimeType}');
    }
  }
}
