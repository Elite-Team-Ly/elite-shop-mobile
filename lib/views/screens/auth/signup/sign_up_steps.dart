import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../controllers/sign_up_controller/sign_up_cubit.dart';
import '../../../../../controllers/sign_up_controller/sign_up_states.dart';
import '../../../../../core/utils/validators.dart';
import '../../../widgets/widgets.dart';

class PartOneWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const PartOneWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.get(context);
    return Center(
      child: Form(
        key: formKey,
        child: Center(
          child: MultiContentBoxWidget(
            width: double.infinity,
            children: [
              CustomTextField(
                title: 'اسم المستخدم',
                controller: cubit.fullNameController,
                hintText: 'الرجاء ادخال اسم المستخدم',
                validator: Validators.name,
              ),
              CustomTextField(
                title: 'رقم الهاتف',
                controller: cubit.phoneController,
                hintText: 'الرجاء ادخال رقم هاتفك',
                validator: Validators.phone,
              ),
              CustomTextField(
                controller: cubit.passController,
                title: 'كلمة المرور',
                hintText: 'الرجاء ادخال كلمة المرور',
                obscureText: cubit.isPassword,
                showIcon: true,
                icon: cubit.suffixIcon,
                iconOnPressed: cubit.changePassVisibilty,
                validator: Validators.password,
              ),
              CustomTextField(
                controller: cubit.confirmPassController,
                title: 'تأكيد كلمة المرور',
                hintText: 'الرجاء تأكيد كلمة المرور',
                obscureText: cubit.isPassword,
                iconOnPressed: cubit.changePassVisibilty,
                validator:
                    (value) => Validators.confirmPassword(
                      value,
                      cubit.passController.text,
                    ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MainTextButton(
                  text: 'الشروط الاستخدام',
                  decoration: TextDecoration.underline,
                  onTap: () {
                    // يمكنك تنفيذ شيء هنا مثل التنقل لصفحة الشروط
                  },
                ),
              ),
              RowWithAction(
                alignment: MainAxisAlignment.start,
                normalWidget: CustomText(
                  'اوافق على شروط الأستخدام',
                  color: AppColors.darkA30,
                ),
                actionWidget: CustomCheckBox(
                  value: cubit.agreeTerms,
                  onChanged: cubit.toggleAgreeTerms,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PartTwoWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const PartTwoWidget({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SignupCubit.get(context);

    return Form(
      key: formKey,
      child: Center(
        child: MultiContentBoxWidget(
          width: double.infinity,
          children: [
            TwoOptionSelector(
              label: 'الجنس',
              firstOption: 'ذكر',
              secondOption: 'أنثى',
              firstValue: 'male',
              secondValue: 'female',
              selectedOptionNotifier: cubit.genderNotifier,
              onChanged: (val) {
                cubit.genderController.text = val;
              },
            ),
            BirthDatePicker(
              label: 'تاريخ الميلاد',
              validator: Validators.birthDate,
              onDateSelected: (DateTime selectedDate) {
                cubit.birthDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
              },
            ),
            CustomDropdownField(
              title: 'المدينة',
              hintText: 'الرجاء ادخل المنطقة ( طرابلس - بنغازي - الخ )',
              value: cubit.cityController.text,
              items: cubit.cities,
              validator: Validators.city,
              onChanged: (selectedId) {
                cubit.onCityChanged(selectedId);
              },
            ),
            BlocBuilder<SignupCubit, SignupStates>(
              builder: (context, state) {
                if (cubit.cityController.text.isNotEmpty && cubit.districts.isNotEmpty) {
                  return CustomDropdownField(
                    title: 'المنطقة',
                    hintText: 'حي الانتصار , أبو سليم , الخ',
                    value: cubit.districtController.text,
                    items: cubit.districts,
                    validator: Validators.district,
                    onChanged: (selectedId) {
                      cubit.ondDistrictChanged(selectedId);
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),

          ],
        ),
      ),
    );
  }
}


// class PartThreeWidget extends StatelessWidget {
//   final TextEditingController passController;
//   final TextEditingController confirmPassController;
//   final ValueNotifier<String> roleNotifier;
//   final bool isPassword;
//   final IconData suffixIcon;
//   final VoidCallback onTogglePassword;
//
//   const PartThreeWidget({
//     super.key,
//     required this.passController,
//     required this.confirmPassController,
//     required this.roleNotifier,
//     required this.isPassword,
//     required this.suffixIcon,
//     required this.onTogglePassword,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TwoOptionSelector(
//           firstOption: 'مشتري',
//           secondOption: 'بائع',
//           selectedOptionNotifier: roleNotifier,
//           onChanged: (val) {
//             roleNotifier.value = val;
//           },
//         ),
//       ],
//     );
//   }
// }
