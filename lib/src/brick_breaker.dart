import 'dart:async';
import 'dart:math' as math;


import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'components/components.dart';
import 'config.dart';

class BrickBraker extends FlameGame{
  BrickBraker()
  : super(
    camera: CameraComponent.withFixedResolution(
      width: gameWidht,
      height: gameHeight,
      ),
  );

  final rand = math.Random();
  double get width => size.x;
  double get height => size.y;

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());

    world.add(Ball(
      velocity: Vector2((rand.nextDouble() - 0.5 ) * width , height * 0.2), 
      position: size/2, 
      radius: ballradius
      ));

  debugMode = true;

  }
}