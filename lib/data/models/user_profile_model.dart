import '../../domain/entities/user_profile.dart';

/// UserProfileModel - Data Layer
class UserProfileModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isVerified;
  final String jobTitle;
  final String company;
  final String school;
  final String location;
  final int connections;
  final String mbtiType;
  final String zodiacSign;
  final List<String> hobbies;

  const UserProfileModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isVerified,
    required this.jobTitle,
    required this.company,
    required this.school,
    required this.location,
    required this.connections,
    required this.mbtiType,
    required this.zodiacSign,
    required this.hobbies,
  });

  // ==================== FACTORY CONSTRUCTORS ====================

  /// Create from JSON
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      isVerified: json['isVerified'] as bool? ?? false,
      jobTitle: json['jobTitle'] as String? ?? '',
      company: json['company'] as String? ?? '',
      school: json['school'] as String? ?? '',
      location: json['location'] as String? ?? '',
      connections: json['connections'] as int? ?? 0,
      mbtiType: json['mbtiType'] as String? ?? '',
      zodiacSign: json['zodiacSign'] as String? ?? '',
      hobbies: (json['hobbies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  /// Create from domain entity
  factory UserProfileModel.fromEntity(UserProfile entity) {
    return UserProfileModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      isVerified: entity.isVerified,
      jobTitle: entity.jobTitle,
      company: entity.company,
      school: entity.school,
      location: entity.location,
      connections: entity.connections,
      mbtiType: entity.mbtiType,
      zodiacSign: entity.zodiacSign,
      hobbies: entity.hobbies,
    );
  }

  // ==================== SERIALIZATION ====================

  /// Convert to JSON (for API requests, local storage, etc.)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'isVerified': isVerified,
      'jobTitle': jobTitle,
      'company': company,
      'school': school,
      'location': location,
      'connections': connections,
      'mbtiType': mbtiType,
      'zodiacSign': zodiacSign,
      'hobbies': hobbies,
    };
  }

  // ==================== DOMAIN MAPPING ====================

  /// Convert to domain entity
  UserProfile toEntity() {
    return UserProfile(
      id: id,
      name: name,
      imageUrl: imageUrl,
      isVerified: isVerified,
      jobTitle: jobTitle,
      company: company,
      school: school,
      location: location,
      connections: connections,
      mbtiType: mbtiType,
      zodiacSign: zodiacSign,
      hobbies: hobbies,
    );
  }

  // ==================== COPY WITH ====================

  UserProfileModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    bool? isVerified,
    String? jobTitle,
    String? company,
    String? school,
    String? location,
    int? connections,
    String? mbtiType,
    String? zodiacSign,
    List<String>? hobbies,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      isVerified: isVerified ?? this.isVerified,
      jobTitle: jobTitle ?? this.jobTitle,
      company: company ?? this.company,
      school: school ?? this.school,
      location: location ?? this.location,
      connections: connections ?? this.connections,
      mbtiType: mbtiType ?? this.mbtiType,
      zodiacSign: zodiacSign ?? this.zodiacSign,
      hobbies: hobbies ?? this.hobbies,
    );
  }

  // ==================== EQUATABILITY ====================

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfileModel &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.isVerified == isVerified &&
        other.jobTitle == jobTitle &&
        other.company == company &&
        other.school == school &&
        other.location == location &&
        other.connections == connections &&
        other.mbtiType == mbtiType &&
        other.zodiacSign == zodiacSign &&
        _listEquals(other.hobbies, hobbies);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        isVerified.hashCode ^
        jobTitle.hashCode ^
        company.hashCode ^
        school.hashCode ^
        location.hashCode ^
        connections.hashCode ^
        mbtiType.hashCode ^
        zodiacSign.hashCode ^
        hobbies.hashCode;
  }

  @override
  String toString() {
    return 'UserProfileModel(id: $id, name: $name, jobTitle: $jobTitle)';
  }

  // ==================== PRIVATE HELPERS ====================

  bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
