import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CenteredSvgIconRow extends StatelessWidget {
  final List<String> svgPaths;
  final double iconSize;
  final double spacing;
  final void Function(int index)? onTap;

  const CenteredSvgIconRow({
    super.key,
    required this.svgPaths,
    this.iconSize = 36,
    this.spacing = 16,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: spacing.w,
        alignment: WrapAlignment.center,
        children: List.generate(svgPaths.length, (index) {
          final path = svgPaths[index];
          return InkWell(
            onTap: onTap != null ? () => onTap!(index) : null,
            borderRadius: BorderRadius.circular(iconSize / 2),
            child: SvgPicture.asset(
              path,
              width: iconSize.w,
              height: iconSize.h,
              fit: BoxFit.contain,
            ),
          );
        }),
      ),
    );
  }
}
