import '../../domain/entities/user_profile.dart';
import '../models/models.dart';

const List<UserProfileModel> profiles = [
  UserProfileModel(
    id: '1',
    name: 'Vermouth',
    imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800',
    isVerified: true,
    jobTitle: 'Human Resources',
    company: 'Tech Company',
    school: 'Universitas Gadjah Mada',
    location: 'Yogyakarta, Yogyakarta',
    connections: 800,
    mbtiType: 'INFJ',
    zodiacSign: 'Leo',
    hobbies: ['Traveling', 'Photography', 'Coffee', 'Music'],
  ),
  UserProfileModel(
    id: '2',
    name: 'Sarah Wijaya',
    imageUrl: 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=800',
    isVerified: true,
    jobTitle: 'UX Designer',
    company: 'Creative Studio',
    school: 'Institut Teknologi Bandung',
    location: 'Jakarta Selatan, DKI Jakarta',
    connections: 1234,
    mbtiType: 'ENFP',
    zodiacSign: 'Pisces',
    hobbies: ['Art', 'Design', 'Yoga', 'Reading'],
  ),
  UserProfileModel(
    id: '3',
    name: 'Amanda Putri',
    imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=800',
    isVerified: false,
    jobTitle: 'Marketing Manager',
    company: 'Startup Indo',
    school: 'Universitas Indonesia',
    location: 'Bandung, Jawa Barat',
    connections: 567,
    mbtiType: 'ENTJ',
    zodiacSign: 'Aries',
    hobbies: ['Networking', 'Business', 'Travel', 'Food'],
  ),
  UserProfileModel(
    id: '4',
    name: 'Dewi Lestari',
    imageUrl: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=800',
    isVerified: true,
    jobTitle: 'Software Engineer',
    company: 'Tech Corp',
    school: 'Institut Teknologi Sepuluh Nopember',
    location: 'Surabaya, Jawa Timur',
    connections: 2341,
    mbtiType: 'INTJ',
    zodiacSign: 'Virgo',
    hobbies: ['Coding', 'Gaming', 'Sci-Fi', 'Coffee'],
  ),
  UserProfileModel(
    id: '5',
    name: 'Rina Kartika',
    imageUrl: 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=800',
    isVerified: true,
    jobTitle: 'Content Creator',
    company: 'Freelance',
    school: 'Universitas Diponegoro',
    location: 'Semarang, Jawa Tengah',
    connections: 5678,
    mbtiType: 'ISFP',
    zodiacSign: 'Libra',
    hobbies: ['Vlogging', 'Fashion', 'Makeup', 'Dance'],
  ),
  UserProfileModel(
    id: '6',
    name: 'Maya Sari',
    imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=800',
    isVerified: false,
    jobTitle: 'Product Manager',
    company: 'E-Commerce Giant',
    school: 'Universitas Airlangga',
    location: 'Malang, Jawa Timur',
    connections: 892,
    mbtiType: 'ESTJ',
    zodiacSign: 'Capricorn',
    hobbies: ['Running', 'Leadership', 'Strategy', 'Books'],
  ),
  UserProfileModel(
    id: '7',
    name: 'Citra Dewi',
    imageUrl: 'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=800',
    isVerified: true,
    jobTitle: 'Data Scientist',
    company: 'AI Startup',
    school: 'Universitas Gadjah Mada',
    location: 'Yogyakarta, Yogyakarta',
    connections: 1523,
    mbtiType: 'INTP',
    zodiacSign: 'Aquarius',
    hobbies: ['AI', 'Research', 'Chess', 'Podcasts'],
  ),
  UserProfileModel(
    id: '8',
    name: 'Bella Pratama',
    imageUrl: 'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=800',
    isVerified: false,
    jobTitle: 'Teacher',
    company: 'International School',
    school: 'Universitas Pendidikan Indonesia',
    location: 'Bandung, Jawa Barat',
    connections: 445,
    mbtiType: 'ESFJ',
    zodiacSign: 'Cancer',
    hobbies: ['Teaching', 'Kids', 'Crafts', 'Music'],
  ),
];

/// Profile Data Source
abstract class ProfileDataSource {
  List<UserProfile> getProfiles();
}

/// Mock Profile Data Source
class ProfileDataSourceMock implements ProfileDataSource {
  @override
  List<UserProfile> getProfiles() {
    return profiles.map((model) => model.toEntity()).toList();
  }
}
