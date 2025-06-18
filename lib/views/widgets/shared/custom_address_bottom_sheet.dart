import 'package:elite_team_training_app/views/widgets/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/config/constants.dart';

class CustomDropdownField extends StatelessWidget {
  final String? title;
  final String hintText;
  final List<Map<String, dynamic>> items;
  final String? value;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;

  const CustomDropdownField({
    super.key,
    this.title,
    required this.items,
    this.hintText = 'اختر عنصر',
    this.value,
    this.onChanged,
    this.validator,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: value,
      validator: validator,
      builder: (formState) {
        final selectedItem = items.firstWhere(
          (e) => e['_id'] == value,
          orElse: () => {'name': null},
        );
        final isError = formState.hasError;

        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Padding(
                  padding: EdgeInsets.only(right: 8.w, bottom: 6.h),
                  child: Text(
                    title ?? '',
                    style: TextStyle(fontSize: 18.sp, color: AppColors.darkA10),
                  ),
                ),

              InkWell(
                onTap:
                    readOnly ? null : () => _showDropdown(context, formState),
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isError ? Colors.red.shade700 : AppColors.darkA50,
                      width: isError ? 1.2 : 0.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          selectedItem['name'] ?? hintText,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color:
                                selectedItem['name'] == null
                                    ? AppColors.lightA40
                                    : AppColors.darkA30,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color:
                            isError
                                ? Colors.red.shade700
                                : AppColors.primaryColor,
                        size: 24.sp,
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
                      Icon(Icons.error_outline, size: 16.sp, color: Colors.red),
                      SizedBox(width: 6.w),
                      Text(
                        formState.errorText!,
                        style: TextStyle(color: Colors.red, fontSize: 12.sp),
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

  Future<void> _showDropdown(
    BuildContext context,
    FormFieldState<String> formState,
  ) async {
    List<Map<String, dynamic>> activeItems =
        items.where((item) {
          return item['status'] != 'inactive';
        }).toList();

    List<Map<String, dynamic>> filteredItems = List.from(activeItems);
    TextEditingController searchController = TextEditingController();

    final selected = await showDialog<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: AppColors.lightColor,
              insetPadding: EdgeInsets.all(16.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                constraints: BoxConstraints(maxHeight: 500.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.w),
                          topRight: Radius.circular(12.w),
                        ),
                        color: AppColors.primaryA50,
                      ),
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title ?? hintText,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkA30,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, size: 24.sp),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),

                    // Search Field
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: CustomTextField(
                        controller: searchController,
                        hintText: 'ابحث...',
                        showIcon: true,
                        icon: Icons.search_rounded,
                        onChanged: (query) {
                          setState(() {
                            filteredItems =
                                activeItems.where((item) {
                                  return item['name']
                                      .toString()
                                      .toLowerCase()
                                      .contains(query.toLowerCase());
                                }).toList();
                          });
                        },
                      ),
                    ),

                    Divider(height: 1, thickness: 1, color: Colors.grey[200]),
                    Expanded(
                      child:
                          filteredItems.isEmpty
                              ? Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Text(
                                    'لا توجد نتائج',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.darkA40,
                                    ),
                                  ),
                                ),
                              )
                              : ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: filteredItems.length,
                                itemBuilder: (context, index) {
                                  final item = filteredItems[index];
                                  final isSelected = item['_id'] == value;
                                  final isSoon = item['status'] == 'soon';

                                  return Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap:
                                          isSoon
                                              ? null
                                              : () => Navigator.pop(
                                                context,
                                                item['_id'],
                                              ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                          vertical: 14.h,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey[100]!,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                item['name'],
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight:
                                                      isSelected
                                                          ? FontWeight.bold
                                                          : FontWeight.normal,
                                                  color:
                                                      isSelected
                                                          ? AppColors
                                                              .primaryColor
                                                          : isSoon
                                                          ? AppColors.darkA40
                                                          : AppColors.darkA30,
                                                ),
                                              ),
                                            ),
                                            if (isSoon)
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w,
                                                  vertical: 4.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        6.r,
                                                      ),
                                                  border: Border.all(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Text(
                                                  'قريباً',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors.lightColor,
                                                  ),
                                                ),
                                              ),
                                            if (isSelected)
                                              Icon(
                                                Icons.check_circle_rounded,
                                                color: AppColors.primaryColor,
                                                size: 18.sp,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    if (selected != null) {
      formState.didChange(selected);
      onChanged?.call(selected);
    }
  }
}
