import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/profile_datasource.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/domain.dart';
import 'profile_notifier.dart';

// ==================== DATA SOURCE ====================

/// Profile Data Source Provider
final profileDataSourceProvider = Provider<ProfileDataSource>((ref) {
  return ProfileDataSourceMock();
});

// ==================== REPOSITORY ====================

/// Profile Repository Provider
/// Dependency Injection: Provides concrete implementation
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dataSource = ref.watch(profileDataSourceProvider);
  return ProfileRepositoryImpl(dataSource);
});

// ==================== USE CASES ====================

/// Fetch Profiles Use Case Provider
final fetchProfilesUseCaseProvider = Provider<FetchProfilesUseCase>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return FetchProfilesUseCase(repository);
});

/// Like Profile Use Case Provider
final likeProfileUseCaseProvider = Provider<LikeProfileUseCase>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return LikeProfileUseCase(repository);
});

/// Pass Profile Use Case Provider
final passProfileUseCaseProvider = Provider<PassProfileUseCase>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return PassProfileUseCase(repository);
});

// ==================== NOTIFIER ====================

/// Profile Notifier Provider
final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, AsyncValue<MatchingData>>((ref) {
  return ProfileNotifier(
    fetchProfilesUseCase: ref.watch(fetchProfilesUseCaseProvider),
    likeProfileUseCase: ref.watch(likeProfileUseCaseProvider),
    passProfileUseCase: ref.watch(passProfileUseCaseProvider),
  );
});
