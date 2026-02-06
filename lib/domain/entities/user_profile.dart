/// UserProfile Entity - Domain Layer
class UserProfile {
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

  const UserProfile({
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

  // ==================== EQUATABILITY ====================

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfile &&
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

  // ==================== COPY WITH ====================

  /// Creates a copy of this UserProfile with the given fields replaced
  UserProfile copyWith({
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
    return UserProfile(
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

  // ==================== TO STRING ====================

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, jobTitle: $jobTitle, company: $company)';
  }

  // ==================== GETTERS ====================

  /// Full work information (job + company)
  String get workInfo => company.isNotEmpty
      ? '$jobTitle at $company'
      : jobTitle;

  /// Connection count formatted
  String get connectionsFormatted => connections > 999
      ? '${(connections / 1000).toStringAsFixed(1)}K'
      : connections.toString();

  /// Location breakdown (city, country)
  List<String> get locationParts => location.split(',');

  /// First location part (usually city)
  String get city => locationParts.isNotEmpty
      ? locationParts[0].trim()
      : '';

  /// Second location part (usually country/province)
  String get country => locationParts.length > 1
      ? locationParts.sublist(1).join(',').trim()
      : '';

  // ==================== PRIVATE HELPERS ====================

  bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
