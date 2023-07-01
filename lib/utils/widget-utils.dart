import 'package:flutter/material.dart';

class WidgetUtils {
  static addClick(Widget childWidget, VoidCallback onClick) {
    return GestureDetector(child: childWidget, onTap: onClick);
  }
}
