class OnBoardingItem {
  final String image;
  final String title;
  final String description;

  const OnBoardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

const List<OnBoardingItem> onboardingData = [
  OnBoardingItem(
    image: 'assets/app/onBoarding/onBoarding1.png',
    title: 'مرحبًا بك في تطبيقنا',
    description: 'تابع شحنتك لحظة بلحظة مع ايليت شوب – لأننا نهتم بوصولها إليك',
  ),
  OnBoardingItem(
    image: 'assets/app/onBoarding/onBoarding2.png',
    title: 'تسوق بسهولة',
    description: 'تجربة تسوق فريدة وسهلة الاستخدام.',
  ),
  OnBoardingItem(
    image: 'assets/app/onBoarding/onBoarding3.png',
    title: 'ابدأ الآن',
    description: 'انضم إلينا واستمتع بالخدمة.',
  ),
];