import '../entities/user_profile.dart';
import '../repositories/profile_repository.dart';

/// Fetch Profiles Use Case
class FetchProfilesUseCase {
  final ProfileRepository _repository;

  FetchProfilesUseCase(this._repository);

  Future<List<UserProfile>> call() async {
    return await _repository.fetchProfiles();
  }
}
