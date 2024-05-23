library flexify;

import 'dart:math' show min;
import 'package:flutter/widgets.dart';

part 'init/flexify_init.dart';
part 'extensions/size_extension.dart';
part 'components/context_creator.dart';

/// A typedef for a function that resolves font sizes.

/// Flexify is a widget that helps in making the UI responsive to different screen sizes.
class Flexify extends StatefulWidget {
  /// The design width of the application.
  final double designWidth;

  /// The design height of the application.
  final double designHeight;

  /// The main application widget.
  final Widget app;

  /// An optional function to resolve font sizes.

  /// A global key for accessing the Flexify state.
  static final globalKey = GlobalKey<_FlexifyState>();

  /// Creates a Flexify widget.
  const Flexify({
    super.key,
    required this.designWidth,
    required this.designHeight,
    required this.app,
  });

  @override
  State<Flexify> createState() => _FlexifyState();
}

class _FlexifyState extends State<Flexify> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FlexifyInit.init(
      designWidth: widget.designWidth,
      designHeight: widget.designHeight,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlexifyContext(
      context: context,
      child: widget.app,
    );
  }
}
