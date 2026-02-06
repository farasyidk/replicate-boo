import '../repositories/profile_repository.dart';

/// Like Profile Use Case
class LikeProfileUseCase {
  final ProfileRepository _repository;

  LikeProfileUseCase(this._repository);

  Future<void> call(String profileId) async {
    await _repository.likeProfile(profileId);
  }
}
