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

      case FlexifyRouteAnimations.flip:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final flipAnimation =
                Tween(begin: 0.0, end: 1.0).animate(animation);
            return AnimatedBuilder(
              animation: flipAnimation,
              child: child,
              builder: (context, child) {
                final angle = flipAnimation.value * 3.141592653589793;
                final isUnder = (angle > 1.5708);
                if (isUnder) {
                  return Transform(
                    transform: Matrix4.rotationY(angle - 3.141592653589793),
                    alignment: Alignment.center,
                    child: page,
                  );
                } else {
                  return Transform(
                    transform: Matrix4.rotationY(angle),
                    alignment: Alignment.center,
                    child: child,
                  );
                }
              },
            );
          },
          transitionDuration: duration,
        );

      case FlexifyRouteAnimations.slideFromBottom:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
                position: animation.drive(tween), child: child);
          },
          transitionDuration: duration,
        );

      case FlexifyRouteAnimations.customFadeScale:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeIn),
            );
            final scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            );
            return FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );

      case FlexifyRouteAnimations.blur:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: animation.value * 10,
                    sigmaY: animation.value * 10,
                  ),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: child,
            );
          },
          transitionDuration: duration,
        );

      case FlexifyRouteAnimations.slideAndFade:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var offsetTween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var fadeTween = Tween(begin: 0.0, end: 1.0);
            return SlideTransition(
              position: animation.drive(offsetTween),
              child: FadeTransition(
                opacity: animation.drive(fadeTween),
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );

      case FlexifyRouteAnimations.rotateAndScale:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;
            var scaleTween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return RotationTransition(
              turns: animation,
              child: ScaleTransition(
                scale: animation.drive(scaleTween),
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );

      case FlexifyRouteAnimations.flipAndFade:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final flipAnimation =
                Tween(begin: 0.0, end: 1.0).animate(animation);
            return AnimatedBuilder(
              animation: flipAnimation,
              child: child,
              builder: (context, child) {
                final angle = flipAnimation.value * 3.141592653589793;
                final isUnder = (angle > 1.5708);
                return Transform(
                  transform: Matrix4.rotationY(angle),
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: animation,
                    child: isUnder
                        ? Transform(
                            transform: Matrix4.rotationY(3.141592653589793),
                            alignment: Alignment.center,
                            child: page,
                          )
                        : child,
                  ),
                );
              },
            );
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
  flip,
  slideFromBottom,
  customFadeScale,
  blur,
  slideAndFade,
  rotateAndScale,
  flipAndFade,
}
