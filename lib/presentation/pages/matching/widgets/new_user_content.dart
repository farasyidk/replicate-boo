import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friendly/core/theme/app_theme.dart';
import 'package:friendly/presentation/pages/matching/widgets/widgets.dart';
import 'package:friendly/presentation/providers/providers.dart';
import 'package:friendly/presentation/widgets/widgets.dart';

/// New User Content Widget
class NewUserContent extends ConsumerStatefulWidget {
  const NewUserContent({super.key});

  @override
  ConsumerState<NewUserContent> createState() => _NewUserContentState();
}

class _NewUserContentState extends ConsumerState<NewUserContent> {
  bool _showLoveAnimation = false;
  bool _showPassAnimation = false;
  SlideDirection _slideDirection = SlideDirection.none;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileNotifierProvider);

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () => ref.read(profileNotifierProvider.notifier).fetchProfiles(),
          color: AppColors.primary,
          backgroundColor: AppColors.white,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: state.when(
              loading: () => const SizedBox(
                height: 600,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              ),
              error: (error, _) => SizedBox(
                height: 600,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: AppColors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Terjadi kesalahan',
                        style: AppTextStyles.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        error.toString(),
                        style: AppTextStyles.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(profileNotifierProvider.notifier).fetchProfiles();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                        ),
                        child: const Text('Coba Lagi'),
                      ),
                    ],
                  ),
                ),
              ),
              data: (matchingData) {
                final currentProfile = matchingData.currentProfile;

                if (currentProfile == null) {
                  return const SizedBox(
                    height: 600,
                    child: EmptyState(
                      title: 'Tidak ada profil',
                      subtitle: 'Profile lain akan muncul di sini',
                      icon: Icons.person_off,
                    ),
                  );
                }

                return AnimatedProfileCard(
                  profile: currentProfile,
                  slideDirection: _slideDirection,
                );
              },
            ),
          ),
        ),
        state.whenOrNull(
          data: (matchingData) => matchingData.currentProfile != null
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ActionButtons(
                    onPass: () => _handlePass(),
                    onLike: () => _handleLike(),
                  ),
                )
              : null,
        ) ?? const SizedBox.shrink(),
        if (_showLoveAnimation) const SparklyHeartAnimation(),
        if (_showPassAnimation) const BrokenHeartAnimation(),
      ],
    );
  }

  Future<void> _handlePass() async {
    setState(() {
      _slideDirection = SlideDirection.left;
      _showPassAnimation = true;
    });

    await ref.read(profileNotifierProvider.notifier).passProfile();

    await Future.delayed(const Duration(milliseconds: 600));
    if (mounted) {
      setState(() {
        _showPassAnimation = false;
        _slideDirection = SlideDirection.none;
      });
    }
  }

  Future<void> _handleLike() async {
    setState(() {
      _slideDirection = SlideDirection.right;
      _showLoveAnimation = true;
    });

    await ref.read(profileNotifierProvider.notifier).likeProfile();

    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      setState(() {
        _showLoveAnimation = false;
        _slideDirection = SlideDirection.none;
      });
    }
  }
}
