import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridCardsView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final int crossAxisCount;
  final double spacing;
  final double aspectRatio;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const CustomGridCardsView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.spacing = 12.0,
    this.aspectRatio = 0.7,
    this.padding,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: shrinkWrap,
        physics: physics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing.w,
          mainAxisSpacing: spacing.h,
          childAspectRatio: aspectRatio,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return itemBuilder(context, item);
        },
      ),
    );
  }
}
