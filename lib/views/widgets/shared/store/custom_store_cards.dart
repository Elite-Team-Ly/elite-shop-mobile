import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/models/stores/store_model.dart';
import 'package:elite_team_training_app/views/widgets/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreCard extends StatelessWidget {
  final StoreModel store;

  const StoreCard({
    super.key, required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.lightColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primaryColor,width: 0.5.sp),

      ),
      child: Column(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: Image.network(
              store.images[0],
              width: double.infinity,
              height: 160.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox(
                height: 160,
                child: Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomText(
                        store.name,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkA30,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      flex: 2,
                      child: Wrap(
                        spacing: 4.w,
                        runSpacing: 4.h,
                        children: store.categories.take(3).map(
                              (category) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                color: AppColors.lightA10,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: CustomText(
                                category.name,
                                fontSize: 14.sp,
                                color: AppColors.darkA30,
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.primaryColor, size: 22),
                    SizedBox(width: 4.w),
                    CustomText("${store.rating}", fontSize: 18.sp, color: AppColors.darkA30),
                    // SizedBox(width: 4.w),
                    // CustomText('(${store.rating})', fontSize: 16.sp, color: AppColors.darkA30),
                  ],
                ),

                SizedBox(height: 8.h),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 22, color: AppColors.primaryColor),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: CustomText(
                        "${store.location.city} - ${store.location.street} • ${store.location.city} كم",
                        fontSize: 18.sp,
                        color: AppColors.darkA30,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),
                Row(
                  children: [
                    const Icon(Icons.local_shipping_outlined, size: 22, color: AppColors.darkA40),
                    SizedBox(width: 4.w),
                    // CustomText('${} د.ل', fontSize: 18.sp, color: AppColors.darkA30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
