import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleRowWidget extends StatelessWidget {
  final Widget? rightWidget;
  final Widget? leftWidget;
  final EdgeInsetsGeometry? padding;

  const TitleRowWidget({
    super.key,
    this.rightWidget,
    this.leftWidget,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (rightWidget != null)
            Align(alignment: Alignment.centerRight, child: rightWidget!),
          if (leftWidget != null)
            Align(alignment: Alignment.centerLeft, child: leftWidget!),
          if (rightWidget == null && leftWidget == null) SizedBox.shrink(),
        ],
      ),
    );
  }
}
