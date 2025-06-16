// import 'package:elite_team_training_app/controllers/otp_controller/otp_cubit.dart';
// import 'package:elite_team_training_app/controllers/sign_up_controller/sign_up_states.dart';
// import 'package:elite_team_training_app/core/config/routes.dart';
// import 'package:elite_team_training_app/models/auth/otp/otp_model.dart';
// import 'package:elite_team_training_app/views/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../controllers/sign_up_controller/sign_up_cubit.dart';
// import '../../../core/utils/validators.dart';
//
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final cubit = SignupCubit.get(context);
//     final otpCubit = OtpCubit.get(context);
//
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'الاشتراك',
//         subtitle: 'أنشئ حسابك الآن واستمتع بكل مزايانا بسهولة وأمان',
//         onBack: () {
//           Navigator.pop(context);
//         },
//       ),
//       body: BlocConsumer<SignupCubit, SignupStates>(
//         listener: (context, state) {
//           if (state is SignupLoadingState) {
//             showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (context) => const LoadingIndicator(),
//             );
//           }
//
//           if (state is SignupSuccessState) {
//             // if (Navigator.canPop(context)) {
//             //   Navigator.pop(context);
//             // }
//             Navigator.pushNamed(
//               context,
//               RouteNames.verifyCode,
//               arguments: {
//                 'otpCubit': otpCubit,
//                 'phoneNumber': cubit.phoneController.text,
//                 'purpose': OtpPurpose.account_creation,
//               },
//             );
//           }
//
//           if (state is SignupErrorState) {
//             if (Navigator.canPop(context)) {
//               Navigator.pop(context);
//             }
//             showDialog(
//               context: context,
//               barrierDismissible: true,
//               builder: (context) {
//                 return AlertDialog(
//                   title: const Text('حدث خطأ ما!'),
//                   content: Text(state.message),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text('حسناً'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         },
//         builder: (context, state) {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 key: cubit.signupFormKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     MultiContentBoxWidget(
//                       width: 300,
//                       children: [
//                         CustomTextField(
//                           controller: cubit.fullNameController,
//                           hintText: 'الأسم بالكامل',
//                           validator: Validators.name,
//                         ),
//                         CustomTextField(
//                           controller: cubit.phoneController,
//                           isPhoneNumber: true,
//                           hintText: 'رقم الهاتف',
//                           keyboardType: TextInputType.phone,
//                           validator: Validators.phone,
//                         ),
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: TwoOptionSelector(
//                                 firstOption: 'مشتري',
//                                 secondOption: 'بائع',
//                                 selectedOptionNotifier: cubit.roleNotifier,
//                                 onChanged: (val) {
//                                   cubit.roleNotifier.value = val;
//                                   cubit.roleController.text = val;
//                                 },
//                               ),
//                             ),
//                             const Text(
//                               "تسجيل كـــ",
//                               style: TextStyle(fontSize: 14),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: ScrollDatePickerField(
//                                 onDateChanged: (DateTime value) {
//                                   cubit.birthDateController.text =
//                                       value.toIso8601String();
//                                 },
//                                 validator: Validators.birthDate,
//                               ),
//                             ),
//                             const Text("العمر", style: TextStyle(fontSize: 14)),
//                           ],
//                         ),
//                         CustomTextField(
//                           controller: cubit.passController,
//                           hintText: 'كلمة المرور',
//                           keyboardType: TextInputType.visiblePassword,
//                           obscureText: cubit.isPassword,
//                           icon: cubit.suffixIcon,
//                           showIcon: true,
//                           iconOnPressed: () {
//                             cubit.changePassVisibilty();
//                           },
//                           validator: Validators.password,
//                         ),
//
//                         CustomTextField(
//                           controller: cubit.confirmPassController,
//                           hintText: 'تأكيد كلمة المرور',
//                           keyboardType: TextInputType.visiblePassword,
//                           obscureText: cubit.isPassword,
//                           showIcon: true,
//                           icon: cubit.suffixIcon,
//
//                           iconOnPressed: () {
//                             cubit.changePassVisibilty();
//                           },
//                           validator:
//                               (value) => Validators.confirmPassword(
//                                 value,
//                                 cubit.passController.text,
//                               ),
//                         ),
//                         CustomTextField(
//                           controller: cubit.cityController,
//                           hintText: 'المنطقة',
//                           keyboardType: TextInputType.streetAddress,
//                           validator:
//                               (value) => Validators.required(
//                                 value,
//                                 message: 'يرجى إدخال المدينة',
//                               ),
//                         ),
//                         CustomTextField(
//                           controller: cubit.addressController,
//                           hintText: 'العنوان',
//                           validator:
//                               (value) => Validators.required(
//                                 value,
//                                 message: 'يرجى إدخال العنوان',
//                               ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     MainButton(
//                       width: 130,
//                       onPressed: () async {
//                         if (cubit.signupFormKey.currentState!.validate()) {
//                           cubit.signup();
//                         }
//                       },
//                       child: const Text("أشتراك"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
