import 'package:elite_team_training_app/core/config/constants.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.of(context).canPop();

    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        bottom: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (canPop)
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 28,
                color: Colors.black.withAlpha((0.7 * 255).round()),
              ),
              onPressed: onBack ?? () => Navigator.of(context).pop(),
            )
          else
            const SizedBox(width: 48),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  title,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkA20,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) const SizedBox(height: 4),
                if (subtitle != null)
                  CustomText(
                    subtitle!,
                    fontSize: 16,
                    color: AppColors.darkA30,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),

          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
