import 'package:flutter/material.dart';

/// Matching App Bar Widget
class MatchingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onFlashTap;
  final VoidCallback? onLanguageTap;
  final VoidCallback? onSettingsTap;

  const MatchingAppBar({
    super.key,
    this.onMenuTap,
    this.onFlashTap,
    this.onLanguageTap,
    this.onSettingsTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: onMenuTap,
            splashRadius: 20,
          ),
      title: const Text(
        'BOO',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: onLanguageTap,
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: onSettingsTap,
        ),
      ],
    );
  }
}
