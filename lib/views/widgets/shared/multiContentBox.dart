import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';

class MultiContentBoxWidget extends StatelessWidget {
  final List<Widget> children;
  final double? width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final Color? backgroundColor;
  final BoxShadow? boxShadow;

  const MultiContentBoxWidget({
    super.key,
    required this.children,
    this.width = 240,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.borderRadius = 20,
    this.backgroundColor,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color:
              backgroundColor ??
              AppColors.dynamicColor(
                context: context,
                darkModeColor: AppColors.dark_a10,
                lightModeColor: AppColors.light_a10,
              ),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            boxShadow ??
                const BoxShadow(
                  color: AppColors.light_a20,
                  offset: Offset(0, 8),
                  blurRadius: 10,
                ),
          ],
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }
}
