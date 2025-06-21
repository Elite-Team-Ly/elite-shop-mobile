import 'package:elite_team_training_app/views/widgets/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/models/products/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductCardV1 extends StatelessWidget {
  final Product product;

  const CustomProductCardV1({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      height: 300.h,
      width: 200.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 0.5),
        color: AppColors.lightColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 1.5 / 1.2,
              child:
                  product.images[0].isNotEmpty
                      ? Image.network(product.images[0], fit: BoxFit.cover,alignment: Alignment.topCenter)
                      : const Placeholder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  product.name,
                  color: AppColors.darkA30,
                  fontSize: 18.sp,
                ),
                CustomText(
                  '${product.salePrice} د.ل ',
                  color: AppColors.darkA30,
                  fontSize: 18.sp,
                ),
                Row(
                  spacing: 12.w,
                  children: [
                    CustomText(
                      product.store.name,
                      color: AppColors.darkA30,
                      fontSize: 18.sp,
                    ),
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

class ProductDiscountCard extends StatelessWidget {
  final Product product;

  const ProductDiscountCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightColor,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            child: Image.network(
              height: 150.h,
              width: 150.w,
              product.images[0],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          CustomText(product.name, color: AppColors.darkA30, fontSize: 18.sp),
          const SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              'تخفيض يصل إلى ${product.discountPercent}%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
