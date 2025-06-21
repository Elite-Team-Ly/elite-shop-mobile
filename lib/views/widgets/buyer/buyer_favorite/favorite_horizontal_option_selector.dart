import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalOptionSelector extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final Color activeColor;
  final Color inactiveColor;
  final TextStyle? activeTextStyle;
  final TextStyle? inactiveTextStyle;
  final EdgeInsetsGeometry itemPadding;
  final double spacing;

  const HorizontalOptionSelector({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.activeTextStyle,
    this.inactiveTextStyle,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: options.length,
        separatorBuilder: (_, __) => SizedBox(width: spacing.w),
        itemBuilder: (context, index) {
          final bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelect(index),
            child: Container(
              padding: itemPadding,
              decoration: BoxDecoration(
                color: isSelected ? activeColor.withOpacity(0.2) : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? activeColor : inactiveColor,
                  width: 1,
                ),
              ),
              child: Text(
                options[index],
                style: isSelected
                    ? (activeTextStyle ??
                    TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: activeColor,
                    ))
                    : (inactiveTextStyle ??
                    TextStyle(
                      fontSize: 16.sp,
                      color: inactiveColor,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
