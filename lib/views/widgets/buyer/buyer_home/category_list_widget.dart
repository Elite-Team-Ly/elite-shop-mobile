import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/shared/buttons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/categories/category_model.dart';

class CategoryListWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryListWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final categories = category.data;

    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 18.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            children: [
              MainSvgIconButton(
                onPressed: () {
                },
                width: 66,
                height: 66,
                backgroundColor:
                AppColors.primaryA50.withAlpha((0.2 * 255).toInt()),
                svgPath: '${AppLink.imageServer}${category.icon}',
              ),
              SizedBox(height: 6.h),
              Text(
                category.name,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
