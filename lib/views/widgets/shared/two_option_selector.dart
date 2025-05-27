import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';

class TwoOptionSelector extends StatelessWidget {
  final String firstOption;
  final String secondOption;
  final String selectedOption;
  final void Function(String) onChanged;

  const TwoOptionSelector({
    super.key,
    required this.firstOption,
    required this.secondOption,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildOption(firstOption),
        const SizedBox(width: 12),
        _buildOption(secondOption),
      ],
    );
  }

  Widget _buildOption(String option) {
    final bool isSelected = option == selectedOption;

    return GestureDetector(
      onTap: () => onChanged(option),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.lightColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.lightA20,
          ),
        ),
        child: Text(
          option,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontWeight: FontWeight.w600,
            fontSize: 14
          ),
        ),
      ),
    );
  }
}
