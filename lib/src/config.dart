
import 'package:flutter/material.dart';                         

//wall colors
const brickColors = [                                           // Add this const
  Color(0xfff94144),
  Color(0xfff3722c),
  Color(0xfff8961e),
  Color(0xfff9844a),
  Color(0xfff9c74f),
  Color(0xff90be6d),
  Color(0xff43aa8b),
  Color(0xff4d908e),
  Color(0xff277da1),
  Color(0xff577590),
];

const gameWidht = 820.0;
const gameHeight = 1600.0;
const ballRadius = gameWidht * 0.02;
const batWidth = gameWidht * 0.2;
const batHeight = ballRadius * 2;
const batStep = gameWidht * 0.05;
const brickGutter = gameWidht * 0.015;                     
final brickWidth =
    (gameWidht - (brickGutter * (brickColors.length + 1)))
    / brickColors.length;
const brickHeight = gameHeight * 0.03;
const difficultyModifier = 1.03;