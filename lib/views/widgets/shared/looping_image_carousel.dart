// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class LoopingImageCarousel extends StatelessWidget {
//   final List<AdModel> ads;
//   final double height;
//   final double viewportFraction;
//   final void Function(AdModel)? onImageTap;
//
//   const LoopingImageCarousel({
//     super.key,
//     required this.ads,
//     this.height = 200,
//     this.viewportFraction = 0.8,
//     this.onImageTap,
//   });
//
//   int _getRealIndex(int index) {
//     return index % ads.length;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = PageController(
//       initialPage: 1000 * ads.length,
//       viewportFraction: viewportFraction, // لا تضع .w هنا لأنها نسبة
//     );
//
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 24.h),
//       height: height.h,
//       child: PageView.builder(
//         controller: controller,
//         itemBuilder: (_, index) {
//           final realIndex = _getRealIndex(index);
//           final ad = ads[realIndex];
//
//           return GestureDetector(
//             onTap: () => onImageTap?.call(ad),
//             child: AnimatedBuilder(
//               animation: controller,
//               builder: (context, child) {
//                 double scale = 1.0;
//                 if (controller.position.hasPixels) {
//                   double page =
//                       controller.page ?? controller.initialPage.toDouble();
//                   scale = (1 - (page - index).abs() * 0.3).clamp(0.85, 1.0);
//                 }
//
//                 return Center(
//                   child: Transform.scale(
//                     scale: scale,
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 8.w),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.r),
//                         image: DecorationImage(
//                           image: NetworkImage(ad.image),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
