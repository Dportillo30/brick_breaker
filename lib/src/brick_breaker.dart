import 'dart:async';
import 'dart:math' as math;


import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';

import 'components/components.dart';
import 'config.dart';

class BrickBraker extends FlameGame 
with HasCollisionDetection, KeyboardEvents{
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

      world.add(Bat(                                             
        size: Vector2(batWidth, batHeight),
        cornerRadius: const Radius.circular(ballradius / 2),
        position: Vector2(width / 2, height * 0.95)));         
  }

  @override                                                     //
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowLeft:
        world.children.query<Bat>().first.moveBy(-batStep);
      case LogicalKeyboardKey.arrowRight:
        world.children.query<Bat>().first.moveBy(batStep);
    }
    return KeyEventResult.handled;
  }                                                     
}