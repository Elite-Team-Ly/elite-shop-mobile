import 'package:elite_team_training_app/controllers/auth_controller/auth_cubit.dart';
import 'package:elite_team_training_app/controllers/auth_controller/auth_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/mock/mock_data.dart';
import '../../../models/products/product_model.dart';
import '../../../models/stores/store_model.dart';
import '../../widgets/buyer/buyer_home/home_app_bar.dart';
import '../../widgets/shared/product/custom_product_cards.dart';
import '../../widgets/shared/section_containe.dart';
import '../../widgets/shared/store/custom_store_cards.dart';
import '../../widgets/shared/title_row_widget.dart';
import '../../widgets/widgets.dart';

class BuyerHomeScreen extends StatelessWidget {
   BuyerHomeScreen({super.key});

  final stores = fakeStores;
  final products = fakeProducts;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthFailState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.onboarding,
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم تسجيل الخروج بنجاح')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              CustomHeaderWidget(
                locationTitle: "موقع التوصيل",
                locationSubtitle: "طرابلس، أبو سليم",
                onLocationTap: () {},
                onNotificationTap: () {},
                onFavoriteTap: () {
                  Navigator.pushNamed(context, RouteNames.buyerFavorite);
                },
              ),
              AppSectionContainer(
                backgroundColor: AppColors.lightColor,
                children: [
                  TitleRowWidget(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 18.w,
                    ),
                    rightWidget: CustomText(
                      "التصنيفات",
                      fontSize: 24.sp,
                      color: AppColors.darkA30,
                    ),
                    leftWidget: MainTextButton(
                      text: "عرض الكل",
                      onTap: () {},
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  // waiting home controller
                  // CategoryListWidget(category: null,),
                  TitleRowWidget(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 18.w,
                    ),

                    rightWidget: CustomText(
                      "العلامات التجارية الشعبية",

                      fontSize: 24.sp,
                      color: AppColors.darkA30,
                    ),
                  ),
                  TitleRowWidget(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 18.w,
                    ),
                    rightWidget: CustomText(
                      "الموصى لك ",
                      fontSize: 24.sp,
                      color: AppColors.darkA30,
                    ),
                  ),
                  CustomHorizontalCardsView<Product>(
                    items: fakeProducts,
                    itemBuilder: (context, product) {
                      return CustomProductCardV1(product: product);
                    },
                  ),
                  CustomVerticalCardsView<StoreModel>(
                    items: fakeStores,
                    itemBuilder: (context, store) {
                      return StoreCard(store: store,

                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<AuthCubit>().logout();
          },
          child: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
