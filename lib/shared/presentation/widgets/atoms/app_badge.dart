import 'package:flutter/material.dart';
import 'package:thomas_app/core/theme/app_colors.dart';
import 'package:thomas_app/core/theme/app_shadows.dart';

class AppBadge extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final bool hasGradient;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const AppBadge({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.hasGradient = false,
    this.padding,
    this.borderRadius = 20,
  });

  factory AppBadge.category({required String text, IconData? icon}) {
    return AppBadge(
      text: text,
      icon: icon ?? Icons.category_rounded,
      hasGradient: true,
      borderColor: AppColors.primary.withValues(alpha: 0.3),
      textColor: AppColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    );
  }

  factory AppBadge.rating({required String rating, String? count}) {
    return AppBadge(
      text: count != null ? '$rating ($count)' : rating,
      icon: Icons.star_rounded,
      backgroundColor: Colors.amber.withValues(alpha: 0.1),
      textColor: const Color(0xFFF57C00),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }

  factory AppBadge.featured({String text = 'Nuevo'}) {
    return AppBadge(
      text: text,
      icon: Icons.star_rounded,
      hasGradient: true,
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: hasGradient ? AppColors.shimmerGradient : null,
        color: !hasGradient ? backgroundColor : null,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 1.5)
            : null,
        boxShadow: hasGradient ? AppShadows.badgeGlow : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: hasGradient ? 14 : 16,
              color: textColor ?? AppColors.primary,
            ),
            SizedBox(width: hasGradient ? 4 : 6),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: hasGradient ? 11 : 12,
              color: textColor ?? AppColors.primary,
              fontWeight: hasGradient ? FontWeight.bold : FontWeight.w700,
              letterSpacing: hasGradient ? 0.5 : 1,
            ),
          ),
        ],
      ),
    );
  }
}
