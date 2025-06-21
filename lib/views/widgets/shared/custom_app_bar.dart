import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets.dart';

class CustomAppBarV1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;

  const CustomAppBarV1({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
  });

  @override
  Size get preferredSize => Size.fromHeight(140.h);

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.of(context).canPop();

    return Container(
      width: double.infinity,
      height: preferredSize.height,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8.h,
        left: 16.w,
        right: 16.w,
        bottom: 8.h,
      ),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 48.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  title,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkA20,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) SizedBox(height: 4.h),
                if (subtitle != null)
                  CustomText(
                    subtitle!,
                    fontSize: 18.sp,
                    color: AppColors.darkA30,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
          if (canPop)
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 28.sp,
                color: AppColors.darkA30,
              ),
              onPressed: onBack ?? () => Navigator.of(context).pop(),
            )
          else
            SizedBox(width: 48.w),
        ],
      ),
    );
  }
}

class CustomAppBarV2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showIcons;
  final bool showSearch;
  final Function()? onLeftIconTap;
  final Function()? onRightIconTap;
  final String leftIconSvgPath;
  final String rightIconSvgPath;


  const CustomAppBarV2({
    super.key,
    this.showIcons = true,
    this.showSearch = true,
    this.onLeftIconTap,
    this.onRightIconTap,
    required this.title,
    required this.leftIconSvgPath,
    required this.rightIconSvgPath,
  });

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 12.h,
            left: 16.w,
            right: 16.w,
            bottom: 12.h,
          ),
          child: SizedBox(
            height: 48.h,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: MainSvgIconButton(
                    showSplashEffect: false,
                    svgPath: AppAssets.iconBack,
                    onPressed: () => Navigator.of(context).pop(),
                    showBackgroundColor: false,
                    iconSize: 28.sp,
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    title,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkA30,
                  ),
                ),

                if (showIcons)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MainSvgIconButton(
                          svgPath: rightIconSvgPath,
                          onPressed: onRightIconTap,
                          showBackgroundColor: false,
                          iconSize: 28.sp,
                        ),
                        SizedBox(width: 10.w),
                        MainSvgIconButton(
                          svgPath: leftIconSvgPath,
                          onPressed: onLeftIconTap,
                          showBackgroundColor: false,
                          iconSize: 28.sp,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        Divider(color: AppColors.primaryColor, thickness: 2),
      ],
    );
  }
}
