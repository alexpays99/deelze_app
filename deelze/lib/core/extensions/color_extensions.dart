import 'package:flutter/material.dart';

extension StringColor on String {
  Color textToColor() {
    if (isEmpty) {
      return Colors.black;
    }
    var hash = 0;
    for (var i = 0; i < length; i++) {
      hash = codeUnitAt(i) + ((hash << 5) - hash);
    }
    return Color(hash + 0xFF000000);
  }
}
