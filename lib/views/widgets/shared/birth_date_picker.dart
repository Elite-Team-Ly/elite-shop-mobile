import 'package:elite_team_training_app/views/widgets/shared/buttons_widgets.dart';
import 'package:elite_team_training_app/views/widgets/shared/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../core/config/constants.dart';

class BirthDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateSelected;
  final String? label;
  final String? hintText;

  const BirthDatePicker({
    super.key,
    this.initialDate,
    required this.onDateSelected,
    this.label,
    this.hintText = 'اختر تاريخ الميلاد',
  });

  @override
  State<BirthDatePicker> createState() => _BirthDatePickerState();
}

class _BirthDatePickerState extends State<BirthDatePicker> {
  late DateTime _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    _selectedDate =
        widget.initialDate ??
        DateTime.now().subtract(const Duration(days: 365 * 18));
  }

  void _openDatePickerSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.lightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        DateTime tempPicked = _selectedDate;
        return SizedBox(
          height: 300.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  "أختر تاريخ الميلاد",
                  color: AppColors.darkA30,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Divider(color: AppColors.darkA50, thickness: 0.5),
                SizedBox(height: 8.h),
                Expanded(
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontSize: 22.sp,
                          color: AppColors.darkA30,
                        ),
                      ),
                    ),
                    child: MediaQuery(
                      data: MediaQuery.of(
                        context,
                      ).copyWith(textScaler: TextScaler.linear(1.0)),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: _selectedDate,
                        minimumDate: DateTime(1955),
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (newDate) => tempPicked = newDate,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Divider(color: AppColors.darkA50, thickness: 0.5),
                SizedBox(height: 8.h),
                MainButton(
                  onPressed: () {
                    setState(() => _selectedDate = tempPicked);
                    widget.onDateSelected(tempPicked);
                    Navigator.of(context).pop();
                  },
                  color: AppColors.primaryA30,
                  child: Text("تاكيد"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: EdgeInsets.only(bottom: 8.h, right: 8.w),
              child: Text(
                widget.label!,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkA30,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          GestureDetector(
            onTap: _openDatePickerSheet,
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.lightColor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.darkA50.withAlpha((0.3 * 255).round()),
                  width: 1,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _dateFormat.format(_selectedDate),
                    style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.primaryColor,
                    size: 24.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
