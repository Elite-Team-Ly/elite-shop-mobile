import 'package:flutter/material.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import '../../core/data/fakeModel/ad_model.dart';
import '../../core/data/fakeModel/category_model.dart';
import '../../core/data/fake_data.dart';
import '../widgets/home/category_list_widget.dart';
import '../widgets/home/home_app_bar.dart';
import '../widgets/shared/looping_image_carousel.dart';
import '../widgets/shared/section_containe.dart';
import '../widgets/shared/title_row_widget.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomHeaderWidget(
              locationTitle: "موقع التوصيل",
              locationSubtitle: "طرابلس، أبو سليم",
              onLocationTap: (){},
              onNotificationTap: (){},
              onFavoriteTap: (){},
            ),
            Expanded(
              child: AppSectionContainer(
                backgroundColor: Colors.grey.shade200,
                child: ListView(
                  children: [
                    TitleRowWidget(
                      rightWidget: CustomText("الفئات", fontSize: 20),
                      leftWidget: MainTextButton(
                        text: "عرض الكل",
                        onTap: () {},
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),

                    FutureBuilder<List<CategoryModel>>(
                      future: FakeApiService.fetchCategories(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox.shrink();
                        } else if (snapshot.hasError) {
                          return SizedBox.shrink();
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return SizedBox.shrink();
                        } else {
                          return CategoryListWidget(categories: snapshot.data!);
                        }
                      },
                    ),
                    FutureBuilder<List<AdModel>>(
                      future: FakeApiService.fetchAds(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox.shrink();
                        } else if (snapshot.hasError) {
                          return SizedBox.shrink();
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return SizedBox.shrink();
                        }
                        return LoopingImageCarousel(
                          ads: snapshot.data!,
                          height: 140,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
