part of '/flexify.dart';

/// FlexifyRouteAnimationBuilder handles the creation of routes with custom animations.
class FlexifyRouteAnimationBuilder {
  static Route build(
    BuildContext context,
    Widget page,
    FlexifyRouteAnimations animation,
    Duration duration,
  ) {
    switch (animation) {
      case FlexifyRouteAnimations.fade:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: duration,
        );
      case FlexifyRouteAnimations.slide:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
                position: animation.drive(tween), child: child);
          },
          transitionDuration: duration,
        );
      case FlexifyRouteAnimations.scale:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return ScaleTransition(scale: animation.drive(tween), child: child);
          },
          transitionDuration: duration,
        );
      case FlexifyRouteAnimations.rotate:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return RotationTransition(turns: animation, child: child);
          },
          transitionDuration: duration,
        );

      case FlexifyRouteAnimations.zoom:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(scale: animation, child: child);
          },
          transitionDuration: duration,
        );
      case FlexifyRouteAnimations.size:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Align(
              child: SizeTransition(sizeFactor: animation, child: child),
            );
          },
          transitionDuration: duration,
        );

      case FlexifyRouteAnimations.elastic:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final bounceOutTween = CurveTween(curve: Curves.elasticOut);
            return ScaleTransition(
                scale: animation.drive(bounceOutTween), child: child);
          },
          transitionDuration: duration,
        );
      default:
        return MaterialPageRoute(builder: (_) => page);
    }
  }
}

enum FlexifyRouteAnimations {
  fade,
  slide,
  scale,
  rotate,
  zoom,
  size,
  elastic,
}
