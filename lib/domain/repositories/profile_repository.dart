import '../entities/user_profile.dart';

/// Profile Repository Interface
abstract class ProfileRepository {
  /// Fetch all available profiles
  Future<List<UserProfile>> fetchProfiles();

  /// Save like action
  Future<void> likeProfile(String profileId);

  /// Save pass action
  Future<void> passProfile(String profileId);
}
