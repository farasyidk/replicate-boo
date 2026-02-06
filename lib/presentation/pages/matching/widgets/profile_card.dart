import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:friendly/core/theme/app_theme.dart';
import 'package:friendly/domain/entities/user_profile.dart';

/// Profile Card Widget
class ProfileCard extends StatelessWidget {
  final UserProfile profile;

  const ProfileCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 600,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackgroundImage(),
            _buildHobbyTags(),
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return CachedNetworkImage(
      imageUrl: profile.imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: AppColors.gray200,
      ),
      errorWidget: (context, url, error) => Container(
        color: AppColors.gray200,
        child: const Icon(
          Icons.person,
          size: 64,
          color: AppColors.gray400,
        ),
      ),
    );
  }

  Widget _buildHobbyTags() {
    if (profile.hobbies.isEmpty) return const SizedBox.shrink();

    return Positioned(
      top: 16,
      right: 16,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: profile.hobbies.take(3).map((hobby) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.white30,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  hobby,
                  style: AppTextStyles.labelSmall.copyWith(color: AppColors.white),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.profileCardGradient,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNameSection(),
            const SizedBox(height: 8),
            if (profile.workInfo.isNotEmpty)
              _buildInfoRow(Icons.work, profile.workInfo),
            if (profile.school.isNotEmpty) ...[
              const SizedBox(height: 4),
              _buildInfoRow(Icons.school, profile.school),
            ],
            if (profile.location.isNotEmpty) ...[
              const SizedBox(height: 4),
              _buildInfoRow(Icons.location_on, profile.location),
            ],
            const SizedBox(height: 8),
            _buildTagsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameSection() {
    return Row(
      children: [
        Text(
          profile.name,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (profile.isVerified) ...[
          const SizedBox(width: 8),
          const Icon(
            Icons.verified,
            color: AppColors.blue,
            size: 20,
          ),
        ],
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.white, size: 16),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyles.bodySmall.copyWith(color: AppColors.white),
        ),
      ],
    );
  }

  Widget _buildTagsSection() {
    return Row(
      children: [
        _buildInfoTag(Icons.people, profile.connectionsFormatted),
        const SizedBox(width: 8),
        if (profile.mbtiType.isNotEmpty)
          _buildInfoTag(Icons.psychology, profile.mbtiType),
        if (profile.mbtiType.isNotEmpty && profile.zodiacSign.isNotEmpty)
          const SizedBox(width: 8),
        if (profile.zodiacSign.isNotEmpty)
          _buildInfoTag(Icons.star, profile.zodiacSign),
      ],
    );
  }

  Widget _buildInfoTag(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.white, size: 16),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
