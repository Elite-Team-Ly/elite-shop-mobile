import 'package:elite_team_training_app/views/widgets/shared/buttons_widgets.dart';
import 'package:elite_team_training_app/views/widgets/shared/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../core/config/constants.dart';

class BirthDatePicker extends FormField<DateTime> {
  final String? label;
  final String? hintText;

  BirthDatePicker({
    super.key,
    DateTime? initialDate,
    this.label,
    this.hintText = 'اختر تاريخ الميلاد',
    super.validator,
    required ValueChanged<DateTime> onDateSelected,
  }) : super(
         initialValue: initialDate,
         builder: (FormFieldState<DateTime> formState) {
           final bool isError = formState.hasError;
           final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
           final DateTime? selectedDate = formState.value;

           void openDatePicker(BuildContext context) {
             DateTime tempPicked = selectedDate ?? DateTime.now();

             showModalBottomSheet(
               context: context,
               backgroundColor: AppColors.lightColor,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.vertical(
                   top: Radius.circular(20.r),
                 ),
               ),
               builder: (context) {
                 return SizedBox(
                   height: 300.h,
                   child: Padding(
                     padding: EdgeInsets.symmetric(vertical: 16.h),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text(
                           "أختر تاريخ الميلاد",
                           style: TextStyle(
                             fontSize: 22.sp,
                             fontWeight: FontWeight.bold,
                             color: AppColors.darkA30,
                           ),
                           textAlign: TextAlign.center,
                         ),
                         SizedBox(height: 8.h),
                         Divider(color: AppColors.darkA50, thickness: 0.5),
                         SizedBox(height: 8.h),
                         Expanded(
                           child: CupertinoDatePicker(
                             mode: CupertinoDatePickerMode.date,
                             initialDateTime: tempPicked,
                             minimumDate: DateTime(1955),
                             maximumDate: DateTime.now(),
                             onDateTimeChanged: (newDate) {
                               tempPicked = newDate;
                             },
                           ),
                         ),
                         SizedBox(height: 8.h),
                         Divider(color: AppColors.darkA50, thickness: 0.5),
                         SizedBox(height: 8.h),
                         MainButton(
                           onPressed: () {
                             formState.didChange(tempPicked);
                             onDateSelected(tempPicked);
                             Navigator.of(context).pop();
                           },
                           child: CustomText('تأكيد'),
                         ),
                       ],
                     ),
                   ),
                 );
               },
             );
           }

           return Padding(
             padding: EdgeInsets.only(bottom: 16.h),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 if (label != null)
                   Padding(
                     padding: EdgeInsets.only(bottom: 8.h, right: 8.w),
                     child: Text(
                       label,
                       style: TextStyle(
                         fontSize: 18.sp,
                         fontWeight: FontWeight.bold,
                         color: AppColors.darkA30,
                       ),
                       textAlign: TextAlign.right,
                     ),
                   ),
                 InkWell(
                   onTap: () {
                     openDatePicker(formState.context);
                   },
                   borderRadius: BorderRadius.circular(12.r),
                   child: Container(
                     height: 56.h,
                     decoration: BoxDecoration(
                       color: AppColors.lightColor,
                       borderRadius: BorderRadius.circular(12.r),
                       border: Border.all(
                         color:
                             isError ? Colors.red.shade700 : AppColors.darkA50,
                         width: isError ? 1.2 : 0.5,
                       ),
                     ),
                     padding: EdgeInsets.symmetric(horizontal: 16.w),
                     alignment: Alignment.centerLeft,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           selectedDate != null
                               ? dateFormat.format(selectedDate)
                               : hintText ?? 'اختر تاريخ الميلاد',
                           style: TextStyle(
                             fontSize: 16.sp,
                             color:
                                 selectedDate != null
                                     ? AppColors.primaryColor
                                     : AppColors.darkA50,
                           ),
                         ),
                         Icon(
                           Icons.date_range,
                           color:
                               selectedDate != null
                                   ? AppColors.primaryColor
                                   : AppColors.darkA50,
                         ),
                       ],
                     ),
                   ),
                 ),
                 if (isError)
                   Padding(
                     padding: EdgeInsets.only(left: 12.w, top: 6.h),
                     child: Row(
                       children: [
                         Icon(
                           Icons.error_outline,
                           size: 16.sp,
                           color: Colors.red,
                         ),
                         SizedBox(width: 6.w),
                         Expanded(
                           child: Text(
                             formState.errorText ?? '',
                             style: TextStyle(
                               color: Colors.red,
                               fontSize: 12.sp,
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
               ],
             ),
           );
         },
       );
}
