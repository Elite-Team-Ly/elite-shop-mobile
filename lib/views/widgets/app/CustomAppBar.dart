import 'package:flutter/material.dart';
import 'package:elite_team_training_app/core/config/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomAppBar({Key? key, required this.title, this.onBack})
    : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final bool canGoBack = Navigator.of(context).canPop();

    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (canGoBack)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.dark_a20,
                  size: 28,
                ),
                onPressed: onBack ?? () => Navigator.of(context).pop(),
              ),
            ),

          Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.dark_a20,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
