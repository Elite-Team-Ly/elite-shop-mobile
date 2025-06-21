import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHorizontalCardsView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final double? cardWidth;
  final EdgeInsetsGeometry? padding;
  final double spacing;

  const CustomHorizontalCardsView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.cardWidth,
    this.padding,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: spacing.w),
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            child: itemBuilder(context, item),
          );
        },
      ),
    );
  }
}
