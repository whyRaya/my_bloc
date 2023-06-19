import 'package:flutter/material.dart';

class RayaText extends StatelessWidget {
  const RayaText({
    super.key,
    required this.text,
    this.textState = RayaTextState.m16,
    this.color = Colors.white,
  });

  final String text;
  final RayaTextState textState;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: getRayaFontSize(textState),
          color: color,
          fontWeight: getRayaFontWeight(textState)),
    );
  }
}

TextStyle getRayaTextStyle(RayaTextState state, Color color) {
  return TextStyle(
      fontSize: getRayaFontSize(state),
      color: color,
      fontWeight: getRayaFontWeight(state)
  );
}

double getRayaFontSize(RayaTextState state) {
  switch (state) {
    case RayaTextState.b30 || RayaTextState.m30:
      {
        return 30;
      }
    case RayaTextState.m21 || RayaTextState.b21:
      {
        return 21;
      }
    case RayaTextState.m16 || RayaTextState.b16:
      {
        return 16;
      }
    default:
      {
        return 14;
      }
  }
}

FontWeight getRayaFontWeight(RayaTextState state) {
  switch (state) {
    case RayaTextState.b30 ||
    RayaTextState.b21 ||
    RayaTextState.b16 ||
    RayaTextState.b14:
      {
        return FontWeight.bold;
      }
    default:
      {
        return FontWeight.w500;
      }
  }
}

enum RayaTextState { b30, m30, b21, m21, b16, m16, b14, m14 }
