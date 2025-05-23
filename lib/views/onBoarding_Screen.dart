import 'package:elite_team_training_app/core/utils/statusHandler.dart';
import 'package:elite_team_training_app/views/widgets/shared/widgets.dart';
import 'package:flutter/material.dart';
import '../core/data/demo/onboarding_data.dart';
import 'widgets/onBoarding_Widgets/onboarding_dots.dart';
import 'widgets/onBoarding_Widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  // ملف البيانات الخاصة بال OnBoarding , تجريبي حتى نديرو ال  Controllers , models
  final List<OnBoardingItem> items = onboardingData;
  // دالة تجريبية ايضا حتى نديرو ال controllers
  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged:
                      (index) => setState(() => _currentPage = index),
                  itemBuilder: (_, index) {
                    final item = onboardingData[index];
                    return OnboardingPage(
                      image: item.image,
                      title: item.title,
                      description: item.description,
                    );
                  },
                ),
              ),
              OnboardingDots(
                currentPage: _currentPage,
                length: onboardingData.length,
              ),
              StatusWidgetHandler(
                statusString: "success",
                successWidget: MainButton(
                  onPressed: _nextPage,
                  isEnabled: true,
                  child: Text("التالي"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
