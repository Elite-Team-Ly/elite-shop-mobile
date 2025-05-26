import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:elite_team_training_app/views/widgets/shared/buttons_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScrollDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateChanged;
  final String hintText;
  final TextStyle? activeTextStyle;
  final TextStyle? inactiveTextStyle;

  const ScrollDatePicker({
    Key? key,
    this.initialDate,
    required this.onDateChanged,
    this.hintText = 'اختر تاريخ الميلاد',
    this.activeTextStyle,
    this.inactiveTextStyle,
  }) : super(key: key);

  @override
  _ScrollDatePickerState createState() => _ScrollDatePickerState();
}

class _ScrollDatePickerState extends State<ScrollDatePicker> {
  late int _day, _month, _year;
  late TextStyle _activeStyle, _inactiveStyle;

  late FixedExtentScrollController _dayController;
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _yearController;

  @override
  void initState() {
    super.initState();

    final init = widget.initialDate ?? DateTime(2000, 6, 15);
    _day = init.day;
    _month = init.month;
    _year = init.year;

    _activeStyle =
        widget.activeTextStyle ??
        TextStyle(
          fontSize: 22,
          color: AppColors.primary_color,
          fontWeight: FontWeight.bold,
        );
    _inactiveStyle =
        widget.inactiveTextStyle ??
        TextStyle(fontSize: 18, color: Colors.grey.withOpacity(0.6));

    _dayController = FixedExtentScrollController(initialItem: _day - 1);
    _monthController = FixedExtentScrollController(initialItem: _month - 1);
    _yearController = FixedExtentScrollController(initialItem: _year - 1900);
  }

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  int _daysInMonth(int year, int month) =>
      DateUtils.getDaysInMonth(year, month);

  void _onSelectedItemChanged() {
    final dim = _daysInMonth(_year, _month);
    if (_day > dim) {
      setState(() => _day = dim);
      _dayController.jumpToItem(dim - 1);
    }
    widget.onDateChanged(DateTime(_year, _month, _day));
  }

  Widget _buildPicker({
    required FixedExtentScrollController controller,
    required int itemCount,
    required ValueChanged<int> onSelectedItemChanged,
    required String Function(int) itemBuilder,
    double width = 60,
  }) {
    return Container(
      width: width,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 50,
        perspective: 0.005,
        diameterRatio: 1.8,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: onSelectedItemChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index >= itemCount) return null;
            final isSelected = controller.selectedItem == index;
            return Center(
              child: Text(
                itemBuilder(index),
                style: isSelected ? _activeStyle : _inactiveStyle,
              ),
            );
          },
          childCount: itemCount,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = _daysInMonth(_year, _month);

    return Dialog(
      backgroundColor: AppColors.light_color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.hintText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.primary_color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPicker(
                  controller: _dayController,
                  itemCount: daysInMonth,
                  onSelectedItemChanged: (index) {
                    setState(() => _day = index + 1);
                    _onSelectedItemChanged();
                  },
                  itemBuilder:
                      (index) => (index + 1).toString().padLeft(2, '0'),
                ),
                _buildPicker(
                  controller: _monthController,
                  itemCount: 12,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _month = index + 1;
                      final dim = _daysInMonth(_year, _month);
                      if (_day > dim) {
                        _day = dim;
                        _dayController.jumpToItem(dim - 1);
                      }
                    });
                    _onSelectedItemChanged();
                  },
                  itemBuilder:
                      (index) => (index + 1).toString().padLeft(2, '0'),
                ),
                _buildPicker(
                  controller: _yearController,
                  itemCount: 201,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _year = 1900 + index;
                      final dim = _daysInMonth(_year, _month);
                      if (_day > dim) {
                        _day = dim;
                        _dayController.jumpToItem(dim - 1);
                      }
                    });
                    _onSelectedItemChanged();
                  },
                  itemBuilder: (index) => (1900 + index).toString(),
                  width: 80,
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainButton(
                  width: 70,
                  onPressed: () => Navigator.pop(context),
                  child: Text("الغاء", style: TextStyle(fontSize: 12)),
                ),
                MainButton(
                  width: 70,

                  onPressed: () {
                    widget.onDateChanged(DateTime(_year, _month, _day));
                    Navigator.pop(context);
                  },
                  child: Text("تم", style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollDatePickerField extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateChanged;
  final String hintText;
  final TextEditingController? controller;

  const ScrollDatePickerField({
    Key? key,
    this.initialDate,
    required this.onDateChanged,
    this.hintText = 'اختر تاريخ الميلاد',
    this.controller,
  }) : super(key: key);

  @override
  State<ScrollDatePickerField> createState() => _ScrollDatePickerFieldState();
}

class _ScrollDatePickerFieldState extends State<ScrollDatePickerField> {
  late DateTime? _selectedDate;
  late TextEditingController _controller;

  final DateFormat _formatter = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _controller = widget.controller ?? TextEditingController();

    if (_selectedDate != null) {
      _controller.text = _formatter.format(_selectedDate!);
    } else {
      _controller.text = '';
    }
  }

  Future<void> _openDatePickerDialog() async {
    await showDialog(
      context: context,
      builder:
          (context) => ScrollDatePicker(
            initialDate: _selectedDate ?? DateTime(2000, 1, 1),
            onDateChanged: (date) {
              setState(() {
                _selectedDate = date;
                _controller.text = _formatter.format(date);
              });
              widget.onDateChanged(date);
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openDatePickerDialog,
      child: AbsorbPointer(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.light_color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: _controller,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.light_a40, fontSize: 14),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: AppColors.light_a40),
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.calendar_today,
                color: AppColors.light_a40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
