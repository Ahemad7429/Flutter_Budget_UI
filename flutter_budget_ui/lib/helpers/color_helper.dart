import 'package:flutter/material.dart';

Color getColor(BuildContext ctx, double percent) {
  if (percent >= 0.5) {
    return Theme.of(ctx).primaryColor;
  } else if (percent >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}
