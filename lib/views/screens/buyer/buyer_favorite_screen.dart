import 'package:elite_team_training_app/views/widgets/shared/product/custom_product_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/constants.dart';
import '../../../core/mock/mock_data.dart';
import '../../../models/products/product_model.dart';
import '../../../models/stores/store_model.dart';
import '../../widgets/buyer/buyer_favorite/favorite_text_tap_selector.dart';
import '../../widgets/shared/custom_grid_view.dart';
import '../../widgets/shared/store/custom_store_cards.dart';
import '../../widgets/widgets.dart';

class BuyerFavoriteScreen extends StatelessWidget {
  BuyerFavoriteScreen({super.key});

  final ValueNotifier<bool> isFirstSelected = ValueNotifier(true);

  final stores = fakeStores;
  final products = fakeProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarV2(
              title: 'المفضلة',
              leftIconSvgPath: AppAssets.iconTask,
              rightIconSvgPath: AppAssets.iconFilter,
              onLeftIconTap: () {},
              onRightIconTap: () {},
            ),
            SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: isFirstSelected,
              builder: (context, selected, _) {
                return TextTabSelector(
                  firstLabel: 'منتجات',
                  secondLabel: 'متاجر',
                  isFirstSelected: selected,
                  onFirstTap: () => isFirstSelected.value = true,
                  onSecondTap: () => isFirstSelected.value = false,
                );
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: ValueListenableBuilder<bool>(
                  valueListenable: isFirstSelected,
                  builder: (context, selected, _) {
                    return selected ? _buildProductsView() : _buildStoresView();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsView() {
    return products.isEmpty
        ? _buildEmptyFavoriteView()
        : CustomGridCardsView<Product>(
          items: fakeProducts,
          itemBuilder: (context, product) {
            return CustomProductCardV1(product: product);
          },
        );
  }

  Widget _buildStoresView() {
    return stores.isEmpty
        ? _buildEmptyFavoriteView()
        : CustomVerticalCardsView<StoreModel>(
          items: fakeStores,
          itemBuilder: (context, store) {
            return StoreCard(store: store);
          },
        );
  }

  Widget _buildEmptyFavoriteView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(height: 260.h, width: 260.w, AppAssets.emptyFavorite),
        CustomText(
          'قائمة المفضلة فارغة',
          fontSize: 24.sp,
          color: AppColors.darkA30,
        ),
      ],
    );
  }
}
