import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/domain.dart';

/// Profile Notifier
class ProfileNotifier extends StateNotifier<AsyncValue<MatchingData>> {
  final FetchProfilesUseCase _fetchProfilesUseCase;
  final LikeProfileUseCase _likeProfileUseCase;
  final PassProfileUseCase _passProfileUseCase;

  ProfileNotifier({
    required FetchProfilesUseCase fetchProfilesUseCase,
    required LikeProfileUseCase likeProfileUseCase,
    required PassProfileUseCase passProfileUseCase,
  })  : _fetchProfilesUseCase = fetchProfilesUseCase,
        _likeProfileUseCase = likeProfileUseCase,
        _passProfileUseCase = passProfileUseCase,
        super(const AsyncValue.loading()) {
    fetchProfiles();
  }

  /// Fetch all profiles
  Future<void> fetchProfiles() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final profiles = await _fetchProfilesUseCase();
      return MatchingData(profiles: profiles);
    });
  }

  /// Handle like action
  Future<void> likeProfile() async {
    final currentState = state;
    if (currentState is! AsyncData<MatchingData>) return;

    final matchingData = currentState.value;
    if (!matchingData.hasMoreProfiles) return;

    final profile = matchingData.currentProfile;
    if (profile == null) return;

    await _likeProfileUseCase(profile.id);

    state = AsyncValue.data(
      matchingData.copyWith(currentIndex: matchingData.currentIndex + 1),
    );
  }

  /// Handle pass action
  Future<void> passProfile() async {
    final currentState = state;
    if (currentState is! AsyncData<MatchingData>) return;

    final matchingData = currentState.value;
    if (!matchingData.hasMoreProfiles) return;

    final profile = matchingData.currentProfile;
    if (profile == null) return;

    await _passProfileUseCase(profile.id);

    state = AsyncValue.data(
      matchingData.copyWith(currentIndex: matchingData.currentIndex + 1),
    );
  }
}
