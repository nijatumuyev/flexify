# Flexify

Flexify is a comprehensive Flutter package that simplifies the creation of responsive user interfaces and enhances navigation with customizable animations. It allows you to easily adapt your app's layout to various screen sizes while providing a smooth and visually appealing navigation experience. With Flexify, scaling widgets proportionally and implementing advanced navigation transitions become effortless, making it an indispensable tool for Flutter developers.


## Features

- **Responsive Design**: Scale your UI elements based on the design dimensions you specify.
- **Customizable Navigation**: Navigate between screens with various animation options.
- **Cross-Platform Support**: Works seamlessly with both `MaterialApp` and `CupertinoApp`.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flexify: ^2.1.0
  ```


<!-- ## Screenshot

<img src="https://raw.githubusercontent.com/nijatumuyev/flexify/main/assets/example.png" alt="Screenshot" width="250"/> -->

## Usage

- Initialize : 

```dart
import 'package:flutter/material.dart';
import 'package:flexify/flexify.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Wrap your app with Flexify for initialize
    return Flexify(
      designWidth: 375,
      designHeight: 812,
      app: MaterialApp(
        home: ExampleScreen(),
      ),
    );
  }
}
```

- Responsive designing : 

```dart
class FlexifyResponsiveWidget extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250.rw, //responsive width
              height: 250.rh, //responsive height
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.rs), // responsive size
              ),
              child: Center(
                child: Text(
                  'This is a Responsive Text',
                  style: TextStyle(
                    fontSize: 22.rt, // responsive font-size
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            20.verticalSpace, // SizedBox(height:20.rh) responsive vertical space
            20.horizontalSpace, // SizedBox(width: 20.rw) responsive horizontal space
          ],
        ),
      ),
    );
  }
}
```

- Easy navigations with animations : 

```dart
Flexify.go(
  NewScreen(),
  animation: FlexifyRouteAnimations.fade,
  duration: Duration(milliseconds: 500),
);

Flexify.goRemove(
  NewScreen(),
  animation: FlexifyRouteAnimations.slide,
  duration: Duration(milliseconds: 500),
);

Flexify.goRemoveAll(
  NewScreen(),
  animation: FlexifyRouteAnimations.scale,
  duration: Duration(milliseconds: 500),
);

Flexify.back();
```

- Available Animations :

```dart
FlexifyRouteAnimations.fade
FlexifyRouteAnimations.slide
FlexifyRouteAnimations.scale
FlexifyRouteAnimations.rotate
FlexifyRouteAnimations.zoom
FlexifyRouteAnimations.size
FlexifyRouteAnimations.elastic
FlexifyRouteAnimations.flip
FlexifyRouteAnimations.slideFromBottom,
FlexifyRouteAnimations.customFadeScale,
FlexifyRouteAnimations.blur,
FlexifyRouteAnimations.slideAndFade,
FlexifyRouteAnimations.rotateAndScale,
FlexifyRouteAnimations.flipAndFade,
```
