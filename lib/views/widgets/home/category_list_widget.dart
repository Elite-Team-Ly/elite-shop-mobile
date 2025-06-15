import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/shared/buttons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/data/fakeModel/category_model.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 18.w),
        itemBuilder: (context, index) {
          final item = categories[index];
          return Column(
            children: [
              MainIconButton(
                icon: item.icon,
                onPressed: () {},
                width: 66,
                height: 66,
                backgroundColor: AppColors.primaryA50.withAlpha((0.2 * 255).toInt()),
              ),
              SizedBox(height: 6.h),
              Text(
                item.title,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      ),
    );
  }
}
