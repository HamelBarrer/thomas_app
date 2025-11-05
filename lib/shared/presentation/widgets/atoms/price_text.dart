import 'package:flutter/material.dart';
import 'package:thomas_app/core/utils/formatters.dart';

class PriceText extends StatelessWidget {
  final double price;
  final TextStyle? style;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  const PriceText({
    super.key,
    required this.price,
    this.style,
    this.color,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultColor = color ?? theme.colorScheme.primary;

    return Text(
      Formatters.formatCurrency(price),
      style:
          style ??
          TextStyle(
            color: defaultColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }
}
