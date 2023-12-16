import 'package:flame/components.dart';
import 'package:flutter/material.dart';


class Ball extends CircleComponent {
  Ball({
    required this.velocity,
    required position,
    required radius
  }) : super (
    radius: radius,
    anchor: Anchor.center,
    paint: Paint()
      ..color = const Color(0xff1e6091)
      ..style = PaintingStyle.fill
  );

  final Vector2 velocity;

  @override
  void update(double dt){
    super.update(dt);
    position += velocity * dt ;
  }
}