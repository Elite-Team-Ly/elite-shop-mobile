import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int currentPage;
  final int length;

  const OnboardingDots({
    super.key,
    required this.currentPage,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: currentPage == index ? 40 : 40,
            height: 14,
            decoration: BoxDecoration(
              color:
                  currentPage == index
                      ? AppColors.primaryColor
                      : AppColors.primaryA40,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
