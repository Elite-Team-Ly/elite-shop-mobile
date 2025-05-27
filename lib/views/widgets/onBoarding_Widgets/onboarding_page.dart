import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/shared/custom_text.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
      child: Column(
        children: [
          Image.asset(image),
          CustomText(
            title,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.dynamicColor(
              context: context,
              darkModeColor: AppColors.darkA30,
              lightModeColor: AppColors.darkA30,
            ),
          ),
          const SizedBox(height: 12),
          CustomText(
            description,
            fontSize: 18,
            textAlign: TextAlign.center,
            color: AppColors.dynamicColor(
              context: context,
              darkModeColor: AppColors.lightColor,
              lightModeColor: AppColors.darkA30,
            ),
          ),
        ],
      ),
    );
  }
}
