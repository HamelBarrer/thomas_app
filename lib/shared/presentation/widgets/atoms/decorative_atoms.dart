import 'package:flutter/material.dart';
import 'package:thomas_app/core/theme/app_colors.dart';
import 'package:thomas_app/core/theme/app_shadows.dart';

class DecorativeCircle extends StatelessWidget {
  final double size;
  final Color? color;
  final double opacity;
  final Alignment alignment;

  const DecorativeCircle({
    super.key,
    required this.size,
    this.color,
    this.opacity = 0.1,
    this.alignment = Alignment.topRight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: alignment == Alignment.topRight || alignment == Alignment.topLeft
          ? -(size * 0.25)
          : null,
      bottom:
          alignment == Alignment.bottomRight ||
              alignment == Alignment.bottomLeft
          ? -(size * 0.3)
          : null,
      right:
          alignment == Alignment.topRight || alignment == Alignment.bottomRight
          ? -(size * 0.25)
          : null,
      left: alignment == Alignment.topLeft || alignment == Alignment.bottomLeft
          ? -(size * 0.3)
          : null,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              (color ?? AppColors.primary).withValues(alpha: opacity),
              (color ?? AppColors.primary).withValues(alpha: 0.0),
            ],
          ),
        ),
      ),
    );
  }
}

class IconButtonAtom extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double iconSize;
  final List<BoxShadow>? boxShadow;

  const IconButtonAtom({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = 48,
    this.iconSize = 24,
    this.boxShadow,
  });

  factory IconButtonAtom.circular({
    required IconData icon,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return IconButtonAtom(
      icon: icon,
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? Colors.white.withValues(alpha: 0.95),
      iconColor: iconColor ?? AppColors.textPrimary,
      boxShadow: AppShadows.floatingButton,
    );
  }

  factory IconButtonAtom.gradient({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButtonAtom(
      icon: icon,
      onPressed: onPressed,
      iconColor: Colors.white,
      boxShadow: AppShadows.primaryButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasGradient = backgroundColor == null && boxShadow != null;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: hasGradient ? null : backgroundColor,
        gradient: hasGradient ? AppColors.primaryGradient : null,
        shape: BoxShape.circle,
        boxShadow: boxShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Center(
            child: Icon(
              icon,
              color: iconColor ?? AppColors.primary,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const GradientContainer({
    super.key,
    required this.child,
    this.borderRadius = 24,
    this.padding,
    this.boxShadow,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient ?? AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow ?? AppShadows.primaryStrong,
      ),
      child: child,
    );
  }
}
