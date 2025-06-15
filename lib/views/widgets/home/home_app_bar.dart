import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/widgets.dart';

class CustomHeaderWidget extends StatelessWidget {
  final String locationTitle;
  final String locationSubtitle;
  final bool showIcons;
  final bool showSearch;
  final Function()? onFavoriteTap;
  final Function()? onNotificationTap;
  final Function()? onLocationTap;
  final Function(String)? onSearchChanged;

  const CustomHeaderWidget({
    super.key,
    this.locationTitle = "الموقع المختار",
    this.locationSubtitle = "لا يوجد موقع",
    this.showIcons = true,
    this.showSearch = true,
    this.onFavoriteTap,
    this.onNotificationTap,
    this.onLocationTap,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                showIcons
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.end,
            children: [
              if (showIcons)
                Row(
                  children: [
                    MainIconButton(
                      icon: Icons.favorite_border,
                      onPressed: onFavoriteTap,
                    ),
                    SizedBox(width: 10.w),
                    MainIconButton(
                      icon: Icons.notifications_none,
                      onPressed: onNotificationTap,
                    ),
                  ],
                ),
              _locationBox(),
            ],
          ),
          if (showSearch) ...[
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: 'حقل البحث',
              icon: Icons.search,
              showIcon: true,
              iconOnPressed: () => onSearchChanged,
            ),
          ],
        ],
      ),
    );
  }

  Widget _locationBox() {
    return GestureDetector(
      onTap: onLocationTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  locationTitle,
                  color: AppColors.lightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                CustomText(
                  locationSubtitle,
                  color: AppColors.lightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ],
            ),
            SizedBox(width: 4.w),
            Icon(Icons.location_on_outlined, size: 24, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
