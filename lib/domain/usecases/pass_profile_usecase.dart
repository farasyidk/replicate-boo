import '../repositories/profile_repository.dart';

/// Pass Profile Use Case
class PassProfileUseCase {
  final ProfileRepository _repository;

  PassProfileUseCase(this._repository);

  Future<void> call(String profileId) async {
    await _repository.passProfile(profileId);
  }
}
