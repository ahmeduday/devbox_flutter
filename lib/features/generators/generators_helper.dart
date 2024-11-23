import 'package:devbox_flutter/features/generators/class_json.dart';
import 'package:flutter/material.dart';

Widget getGeneratorPage(int index) {
  switch (index) {
    case 0:
      return const ClassJsonGeneratorPage();
    default:
      return const ClassJsonGeneratorPage();
  }
}
