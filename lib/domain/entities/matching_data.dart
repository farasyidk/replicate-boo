import 'user_profile.dart';

class MatchingData {
  final List<UserProfile> profiles;
  final int currentIndex;

  const MatchingData({
    required this.profiles,
    this.currentIndex = 0,
  });

  UserProfile? get currentProfile {
    if (currentIndex < profiles.length) {
      return profiles[currentIndex];
    }
    return null;
  }

  bool get hasMoreProfiles => currentIndex < profiles.length;

  MatchingData copyWith({
    List<UserProfile>? profiles,
    int? currentIndex,
  }) {
    return MatchingData(
      profiles: profiles ?? this.profiles,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
