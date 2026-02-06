import 'package:flutter/material.dart';
import 'package:friendly/core/theme/app_theme.dart';

/// Empty State Widget
class EmptyState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;

  const EmptyState({
    super.key,
    required this.title,
    this.subtitle,
    this.icon = Icons.person_off,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: AppColors.gray400,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.gray600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
