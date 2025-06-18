import 'package:flutter/material.dart';
import '../../../core/config/constants.dart';

class PatternBackground extends StatelessWidget {
  final Widget child;

  const PatternBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand( // ✅ تأكد أن الخلفية تأخذ كامل حجم الشاشة
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.pattern,
              fit: BoxFit.cover,
            ),
          ),
          // ✅ نلف child بـ SingleChildScrollView لتفادي القطع
          child,
        ],
      ),
    );
  }
}
