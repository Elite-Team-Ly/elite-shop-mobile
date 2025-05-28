import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowWithAction extends StatelessWidget {
  final Widget normalWidget;
  final Widget actionWidget;
  final VoidCallback onActionTap;
  final MainAxisAlignment alignment;
  final bool rtl;

  const RowWithAction({
    super.key,
    required this.normalWidget,
    required this.actionWidget,
    required this.onActionTap,
    this.alignment = MainAxisAlignment.center,
    this.rtl = true,
  });

  @override
  Widget build(BuildContext context) {
    final children = [
      normalWidget,
      SizedBox(width: 4.w),
      GestureDetector(onTap: onActionTap, child: actionWidget),
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: alignment,
        textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
        children: children,
      ),
    );
  }
}
