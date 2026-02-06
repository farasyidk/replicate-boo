# Re Boo - Find Your Match

A dating app built with Flutter using Clean Architecture and SOLID principles.

## About the App

Re Boo is a dating app with profile matching features. Users can browse profiles, give likes or passes, and get matches.

### Features

- **Browse Profiles**: Scroll and view other user profiles
- **Like/Pass**: Tap heart to like, tap X to pass
- **Transition Animations**: Smooth slide animations on like/pass
- **Cached Images**: Profile images cached for better performance
- **Clean Architecture**: Code organized with domain/data/presentation layers

## Prerequisites

- Flutter SDK (>= 3.8.1)
- Dart SDK (>= 3.8.1)
- IDE (VS Code / Android Studio / IntelliJ)

## How to Run

### 1. Clone Repository

```bash
git clone <repository-url>
cd friendly
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run Application

```bash
# Run on connected device/emulator
flutter run

```


## Project Structure

```
lib/
├── core/                          # Core utilities
│   └── theme/                     # Design system
│       ├── app_colors.dart        # Color palette
│       ├── app_shadows.dart       # Shadows
│       ├── app_text_styles.dart   # Typography
│       └── app_theme.dart         # Theme exports
│
├── domain/                        # Business logic layer
│   ├── entities/                  # Domain entities
│   │   ├── user_profile.dart      # User profile entity
│   │   └── matching_data.dart     # Matching state entity
│   ├── repositories/              # Repository interfaces
│   │   └── profile_repository.dart
│   └── usecases/                  # Business logic
│       ├── fetch_profiles_usecase.dart
│       ├── like_profile_usecase.dart
│       └── pass_profile_usecase.dart
│
├── data/                          # Data layer
│   ├── datasources/               # Data sources
│   │   └── profile_datasource.dart
│   ├── models/                    # Data models
│   │   ├── placeholder_data.dart  # Mock/test data
│   │   └── user_profile_model.dart
│   └── repositories/              # Repository implementations
│       └── profile_repository_impl.dart
│
└── presentation/                  # UI layer
    ├── pages/                     # Screens
    │   ├── main_page.dart         # Main screen with bottom nav
    │   └── matching/              # Matching flow
    │       └── matching_page.dart
    ├── widgets/                   # Reusable widgets
    │   ├── action_animations.dart       # Love/pass animations
    │   ├── animated_profile_card.dart   # Profile card with slide
    │   ├── matching_app_bar.dart        # App bar
    │   └── widgets.dart                 # Widget exports
    ├── providers/                 # State management (Riverpod)
    │   ├── providers.dart              # Provider exports
    │   └── profile_notifier.dart        # Profile state
    └── pages/matching/widgets/      # Matching-specific widgets
        ├── action_buttons.dart          # Pass/like buttons
        ├── empty_state.dart             # Empty state UI
        ├── matching_tab_bar.dart        # Tab switcher
        ├── new_user_content.dart        # Jiwa Baru content
        └── profile_card.dart            # Profile display
```

## Architecture

### Clean Architecture

This app uses **Clean Architecture** with layer separation:

#### 1. Domain Layer (Business Logic)
- **Entities**: Core business objects (UserProfile, MatchingData)
- **Repositories**: Abstractions for data operations
- **Use Cases**: Business logic operations (FetchProfiles, LikeProfile, PassProfile)

**Principles**:
- Independent from framework, UI, database
- Pure Dart code
- Testable business logic

#### 2. Data Layer (Implementation)
- **Data Sources**: Source of data (API, local DB, mock data)
- **Models**: Data transfer objects with JSON serialization
- **Repository Implementations**: Concrete implementations of domain interfaces

**Principles**:
- Implements domain abstractions
- Handle data operations
- Framework agnostic

#### 3. Presentation Layer (UI)
- **Pages**: Complete screens
- **Widgets**: Reusable UI components
- **Providers**: State management with Riverpod
- **Single Responsibility**: Each widget has one responsibility

**Principles**:
- Delegates logic to domain layer
- Manages UI state
- User interactions

### State Management

Uses **Riverpod** with `AsyncValue` pattern:

```dart
// Provider
final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, AsyncValue<MatchingData>>((ref) {
  return ProfileNotifier(
    fetchProfilesUseCase: ref.watch(fetchProfilesUseCaseProvider),
    likeProfileUseCase: ref.watch(likeProfileUseCaseProvider),
    passProfileUseCase: ref.watch(passProfileUseCaseProvider),
  );
});

// Usage in widget
final state = ref.watch(profileNotifierProvider);

return state.when(
  loading: () => CircularProgressIndicator(),
  error: (error, _) => ErrorWidget(error),
  data: (matchingData) => ProfileCard(profile: matchingData.currentProfile),
);
```

### Design System

#### Colors
```dart
// Neutral
AppColors.white, AppColors.black, AppColors.gray50-900

// Primary
AppColors.primary (teal #00BFA5)

// Secondary
AppColors.red, AppColors.pink, AppColors.blue, AppColors.amber, AppColors.green
```

#### Typography
```dart
// Headings
AppTextStyles.h1, h2, h3, h4, h5

// Body
AppTextStyles.bodyLarge, bodyMedium, bodySmall

// Labels
AppTextStyles.labelLarge, labelMedium, labelSmall

// Captions
AppTextStyles.caption, captionSmall
```

### SOLID Principles

1. **Single Responsibility**: Each class has one responsibility
   - `ProfileCard` only displays profile
   - `ActionButtons` only handles buttons
   - `ProfileNotifier` only manages state

2. **Open/Closed**: Open for extension, closed for modification
   - Widgets use composition over inheritance
   - Configuration via constructor parameters

3. **Liskov Substitution**: Consistent implementations
   - `ProfileRepositoryImpl` implements `ProfileRepository`

4. **Interface Segregation**: Focused abstractions
   - Repository methods separated (fetch, like, pass)

5. **Dependency Inversion**: Depend on abstractions
   - Presentation depends on `ProfileRepository` interface
   - Domain doesn't depend on data layer

## Key Features Implementation

### 1. Profile Matching Flow

```dart
// 1. Fetch profiles
await ref.read(profileNotifierProvider.notifier).fetchProfiles();

// 2. Pass profile
await ref.read(profileNotifierProvider.notifier).passProfile();
// → Slide to left
// → Broken heart animation
// → Next profile

// 3. Like profile
await ref.read(profileNotifierProvider.notifier).likeProfile();
// → Slide to right
// → Sparkly heart animation
// → Next profile
```

### 2. Image Caching

Uses `cached_network_image` for better performance:

```dart
CachedNetworkImage(
  imageUrl: profile.imageUrl,
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => ErrorIcon(),
)
```

### 3. Animations

- **Slide Transition**: Card slides left/right on pass/like
- **Scale Animation**: Card shrinks during transition
- **Overlay Animations**: Heart/cross icon animations in corners


## Tech Stack

- **Framework**: Flutter 3.8+
- **Language**: Dart 3.8+
- **State Management**: Riverpod 2.5+
- **Architecture**: Clean Architecture + SOLID
- **Image Caching**: cached_network_image 3.3+

