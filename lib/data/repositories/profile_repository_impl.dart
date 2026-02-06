import '../../domain/domain.dart';
import '../datasources/profile_datasource.dart';

/// Profile Repository Implementation
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource;

  final Set<String> _likedProfiles = {};
  final Set<String> _passedProfiles = {};

  ProfileRepositoryImpl(this._dataSource);

  @override
  Future<List<UserProfile>> fetchProfiles() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _dataSource.getProfiles();
  }

  @override
  Future<void> likeProfile(String profileId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _likedProfiles.add(profileId);
    _passedProfiles.remove(profileId);
  }

  @override
  Future<void> passProfile(String profileId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _passedProfiles.add(profileId);
    _likedProfiles.remove(profileId);
  }

  Set<String> get likedProfiles => Set.unmodifiable(_likedProfiles);
  Set<String> get passedProfiles => Set.unmodifiable(_passedProfiles);
}
