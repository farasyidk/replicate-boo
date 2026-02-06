import 'package:flutter/material.dart';
import 'package:friendly/core/theme/app_theme.dart';

/// Action Buttons Widget
class ActionButtons extends StatelessWidget {
  final VoidCallback? onExplore;
  final VoidCallback? onPass;
  final VoidCallback? onLike;
  final VoidCallback? onMessage;

  const ActionButtons({
    super.key,
    this.onExplore,
    this.onPass,
    this.onLike,
    this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(
            icon: Icons.explore,
            color: AppColors.white,
            onTap: onExplore,
          ),
          _buildActionButton(
            icon: Icons.close,
            color: AppColors.red,
            onTap: onPass,
          ),
          _buildActionButton(
            icon: Icons.favorite,
            color: AppColors.pink,
            onTap: onLike,
          ),
          _buildActionButton(
            icon: Icons.mail,
            color: AppColors.blue,
            onTap: onMessage,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white30,
          boxShadow: AppShadows.actionButton,
        ),
        child: Icon(icon, color: color, size: 32),
      ),
    );
  }
}
