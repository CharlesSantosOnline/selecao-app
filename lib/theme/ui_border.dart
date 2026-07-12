import 'package:flutter/material.dart';

class UiBorder {
  static const double circle = 400;
  static const double square = 0;

  static OutlineInputBorder inputBorder = const OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(UiBorder.square),
      topRight: Radius.circular(UiBorder.square),
      bottomRight: Radius.circular(UiBorder.square),
      bottomLeft: Radius.circular(UiBorder.square),
    ),
  );
}
