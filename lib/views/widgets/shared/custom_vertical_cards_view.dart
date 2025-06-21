import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVerticalCardsView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final double spacing;

  const CustomVerticalCardsView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.padding,
    this.spacing = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.only(bottom: index != items.length - 1 ? spacing.h : 0),
            child: itemBuilder(context, item),
          );
        }),
      ),
    );
  }
}
