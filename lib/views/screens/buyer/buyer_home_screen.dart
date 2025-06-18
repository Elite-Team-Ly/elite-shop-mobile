import 'package:elite_team_training_app/controllers/auth_controller/auth_cubit.dart';
import 'package:elite_team_training_app/controllers/auth_controller/auth_states.dart';
import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/core/config/routes.dart';
import 'package:elite_team_training_app/models/pagination/pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/brands/brand_model.dart';
import '../../../models/categories/category_model.dart';
import '../../widgets/home/brand_list_widget.dart';
import '../../widgets/home/category_list_widget.dart';
import '../../widgets/home/home_app_bar.dart';
import '../../widgets/shared/section_containe.dart';
import '../../widgets/shared/title_row_widget.dart';
import '../../widgets/widgets.dart';

class BuyerHomeScreen extends StatelessWidget {
  BuyerHomeScreen({super.key});

  final BrandModel brandModel = BrandModel(
    data: [
      Brand(
        id: '4',
        logo: 'https://www.freepnglogos.com/uploads/reebok-logo-png/crossfit-logo-reebok-images-galleries-1.png',
        name: 'Reebok',
        images: [],
        description: '',
        url: [],
        phoneNumber: '',
        originType: '',
        createdAt: '',
        updatedAt: '',
      ),
      Brand(
        id: '4',
        logo: 'https://www.freepnglogos.com/uploads/adidas-logo-png-hd-17.png',
        name: 'Reebok',
        images: [],
        description: '',
        url: [],
        phoneNumber: '',
        originType: '',
        createdAt: '',
        updatedAt: '',
      ),
      Brand(
        id: '4',
        logo: 'https://tse2.mm.bing.net/th/id/OIP.4kmmdW6zr6WwWLPlXmrALAHaEM?r=0&rs=1&pid=ImgDetMain',
        name: 'Reebok',
        images: [],
        description: '',
        url: [],
        phoneNumber: '',
        originType: '',
        createdAt: '',
        updatedAt: '',
      ),
    ],
    status: '',
    pagination: Pagination(
      currentPage: 1,
      totalItems: 1,
      totalPages: 1,
      pageSize: 1,
    ),
    message: '',
  );
  final CategoryModel categoryModel = CategoryModel(
    status: 'success',
    data: [
      Category(
        id: '1',
        name: 'إلكترونيات',
        images: [
          'https://cdn-icons-png.flaticon.com/512/3075/3075977.png',
        ],
        icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png',
        productCount: 120,
        subCategories: [
          {'id': '11', 'name': 'هواتف ذكية'},
          {'id': '12', 'name': 'حواسيب محمولة'},
        ],
      ),
      Category(
        id: '2',
        name: 'ملابس',
        images: [
          'https://cdn-icons-png.flaticon.com/512/892/892458.png',
        ],
        icon: 'https://cdn-icons-png.flaticon.com/512/892/892458.png',
        productCount: 250,
        subCategories: [
          {'id': '21', 'name': 'رجالي'},
          {'id': '22', 'name': 'نسائي'},
        ],
      ),
      Category(
        id: '3',
        name: 'أجهزة منزلية',
        images: [
          'https://cdn-icons-png.flaticon.com/512/1046/1046857.png',
        ],
        icon: 'https://cdn-icons-png.flaticon.com/512/1046/1046857.png',
        productCount: 90,
        subCategories: [],
      ),
      Category(
        id: '4',
        name: 'ألعاب وهوايات',
        images: [
          'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
        ],
        icon: 'https://cdn-icons-png.flaticon.com/512/2838/2838912.png',
        productCount: 50,
        subCategories: [
          {'id': '41', 'name': 'ألعاب أطفال'},
          {'id': '42', 'name': 'ألعاب فيديو'},
        ],
      ),
    ],
    pagination: Pagination(
      currentPage: 1,
      totalItems: 4,
      totalPages: 1,
      pageSize: 10,
    ),
    message: '',
  );


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
                onFavoriteTap: () {},
              ),
              Expanded(
                child: AppSectionContainer(
                  backgroundColor: AppColors.lightColor,
                  child: ListView(
                    children: [
                      TitleRowWidget(
                        rightWidget: CustomText(
                          "التصنيفات",
                          fontSize: 20,
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
                      CategoryListWidget(categoryModel: categoryModel ),
                      TitleRowWidget(
                        rightWidget: CustomText(
                          "العلامات التجارية الشعبية",
                          fontSize: 20,
                          color: AppColors.darkA30,
                        ),
                      ),
                      BrandListWidget(brandModel: brandModel),
                    ],
                  ),
                ),
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
