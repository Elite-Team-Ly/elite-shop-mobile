import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleRowWidget extends StatelessWidget {
  final Widget rightWidget;
  final Widget leftWidget;
  final EdgeInsetsGeometry? padding;

  const TitleRowWidget({
    super.key,
    required this.rightWidget,
    required this.leftWidget,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(alignment: Alignment.centerLeft, child: leftWidget),
          Align(alignment: Alignment.centerRight, child: rightWidget),

        ],
      ),
    );
  }
}
