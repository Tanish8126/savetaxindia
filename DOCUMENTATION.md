# SaveTaxIndia App Documentation

This document provides a comprehensive overview of the SaveTaxIndia Flutter application, including its structure, features, and setup instructions.

## 1. Project Overview

SaveTaxIndia is a comprehensive mobile application built with Flutter, designed to help users manage and calculate their taxes in India. The app provides features for tax calculation based on different employment types and income sources, community features like a social feed, professional assistance, and educational resources. It uses Firebase for backend services like authentication and data storage, with additional local storage capabilities.

## 2. Features

### Core Tax Features
- **User Authentication:** Phone number-based authentication with OTP verification using Firebase Auth
- **Tax Calculation:** Detailed tax calculation for different user profiles (salaried, business, etc.)
- **ICAI Module:** Dedicated module for tax calculations based on guidelines from the Institute of Chartered Accountants of India (ICAI), including:
  - Salaries and allowances
  - House Property income
  - Capital Gains
  - PGBP (Profits and Gains from Business or Profession)
  - IOSC (Income from Other Sources)
- **Tax Year Selection:** Modern UI for selecting assessment years with a clean grid layout
- **Employment Type Selection:** Support for different employment types (salaried, business, etc.)
- **Resident Status:** Support for resident and non-resident tax calculations
- **Tax Dashboard:** Comprehensive dashboard showing tax calculations and summaries
- **Refund Options:** Interface for handling tax refunds and related processes

### Social & Community Features
- **Feed/Community:** Social media-like feed (tweets), allowing users to post content
- **User Profiles:** Complete user profiles with followers/following functionality
- **Categories:** Content and features organized into categories
- **Bookmarks:** Save and organize important content
- **Notifications:** Push notifications and in-app notification system
- **Discussion Forum:** Community discussions and Q&A features

### Professional Services
- **Hire Expert:** Users can browse and hire tax professionals directly from the app:
  - Chartered Accountants (tax filing, audit, compliance)
  - Tax Lawyers (legal advice for disputes and notices)
  - Tax Consultants (tax planning and savings guidance)
- **Expert Profiles:** Professional cards with descriptions and direct hire buttons
- **Chat Support:** Integrated chat functionality for expert assistance

### Educational Resources
- **Income Tax Act Browser:** Complete browser for all 298 sections of the Income Tax Act, 1961
- **Case Laws:** Database of relevant tax case laws and precedents
- **Resources Section:** Organized educational content and references

### Additional Features
- **File Upload:** Document upload and management system
- **Subscription Management:** Premium features and subscription handling
- **Language Support:** Multi-language support with changeable interface
- **Account Management:** Profile editing, account settings, and account closure options
- **Referral System:** Friend referral functionality
- **Expat Dashboard:** Specialized dashboard for expatriate users
- **GPT Integration:** AI-powered assistance and guidance

## 3. Project Structure

The project follows a feature-driven directory structure with clear separation of concerns:

```
savetaxindia/
├── android/                    # Android platform-specific files
├── assets/                     # Static assets (images, icons, etc.)
│   ├── icons/                 # SVG and icon files
│   └── images/                # Image assets
├── ios/                       # iOS platform-specific files
├── lib/                       # Core application code
│   ├── controller/            # Business logic controllers
│   │   └── auth_controller.dart
│   ├── global.dart            # Global initialization and configuration
│   ├── icai/                  # Tax calculation logic based on ICAI norms
│   │   ├── salaries/          # Salary-related calculations
│   │   ├── house property/    # House property income
│   │   ├── capital gain/      # Capital gains calculations
│   │   ├── pgbp/             # Business and profession income
│   │   ├── iosc/             # Other sources of income
│   │   ├── total tax/        # Final tax calculations
│   │   ├── employment_type.dart
│   │   └── resident_status.dart
│   ├── main.dart             # Application entry point
│   ├── models/               # Data models and structures
│   │   ├── user_model.dart
│   │   ├── feed_model.dart
│   │   ├── chat_model.dart
│   │   ├── bookmark_model.dart
│   │   ├── notification_model.dart
│   │   ├── push_notification_model.dart
│   │   ├── formdata_model.dart
│   │   └── phone_data_model.dart
│   ├── providers/            # State management providers
│   │   └── user_provider.dart
│   ├── python_server/        # Python backend integration
│   ├── resources/            # Data handling and API methods
│   │   ├── auth_methods.dart
│   │   ├── get_data_methods.dart
│   │   ├── post_data_methods.dart
│   │   ├── update_data_methods.dart
│   │   └── delete_data_methods.dart
│   ├── screens/              # UI screens organized by feature
│   │   ├── splash-to-home/   # Authentication and onboarding
│   │   ├── home/             # Main home screen and navigation
│   │   ├── tax_input_screen/ # Tax data input interface
│   │   ├── taxcal/           # Tax calculation screens
│   │   ├── final_tax_dashboard/ # Tax results dashboard
│   │   ├── hire_expert_screen/  # Expert hiring interface
│   │   ├── resouces_screen/     # Educational resources
│   │   ├── profile_screen/      # User profile management
│   │   ├── tweet_screen/        # Social feed interface
│   │   ├── create_tweet_screen/ # Content creation
│   │   ├── categories/          # Category management
│   │   ├── employment_type/     # Employment type selection
│   │   ├── choose_tax_screen/   # Tax year selection
│   │   ├── edit_income/         # Income editing interface
│   │   ├── upload_file_screen/  # File upload functionality
│   │   ├── subscription screen/ # Subscription management
│   │   ├── my_account_screen/   # Account settings
│   │   ├── tree.my_account/     # Account-related features
│   │   ├── notification_screen/ # Notification management
│   │   ├── push_notification/   # Push notification settings
│   │   ├── gpt_screen/          # AI assistance interface
│   │   ├── ay_dropdown/         # Assessment year selection
│   │   ├── expat_dashboard.dart # Expatriate user dashboard
│   │   ├── refund_option.dart   # Refund processing
│   │   └── discussion_screen.dart # Community discussions
│   ├── utils/                # Utility classes and constants
│   │   ├── constants/        # App constants and configurations
│   │   │   ├── colors.dart
│   │   │   ├── constants.dart
│   │   │   ├── decoration.dart
│   │   │   └── ...
│   │   ├── routes.dart       # Application routing
│   │   ├── theme.dart        # App theme configuration
│   │   └── ...               # Other utility files
│   └── widgets/              # Reusable UI components
│       ├── calculate.dart
│       └── shimmer.dart
├── test/                     # Test files
├── web/                      # Web platform files
├── windows/                  # Windows platform files
├── linux/                    # Linux platform files
├── macos/                    # macOS platform files
├── pubspec.yaml             # Project dependencies and metadata
└── DOCUMENTATION.md         # This documentation file
```

## 4. Technology Stack

### Frontend Framework
- **Flutter:** Cross-platform mobile development framework
- **Dart:** Programming language for Flutter development

### State Management
- **Provider:** State management for user data
- **GetX:** State management, dependency injection, and routing
- **BLoC:** Business Logic Component pattern for complex state management

### Backend Services
- **Firebase Core:** Firebase initialization and configuration
- **Firebase Auth:** User authentication and authorization
- **Cloud Firestore:** NoSQL cloud database
- **Firebase App Check:** Backend resource protection

### Local Storage
- **Hive:** Lightweight key-value database for local storage
- **Get Storage:** Simple persistent storage
- **Shared Preferences:** Simple data persistence
- **ObjectBox:** High-performance local database

### UI/UX Libraries
- **Flutter SVG:** SVG rendering support
- **Google Fonts:** Typography and font management
- **Carousel Slider:** Image carousel functionality
- **Percent Indicator:** Progress indicators
- **Pinput:** OTP input fields
- **Flutter Screenutil:** Responsive UI scaling
- **Dotted Border:** Decorative border widgets
- **Scratcher:** Scratch card functionality

### Networking & APIs
- **HTTP:** HTTP client for API requests
- **Connectivity Plus:** Network connectivity monitoring
- **URL Launcher:** External URL handling
- **Share Plus:** Content sharing functionality

### Authentication & Security
- **Google Sign In:** Google authentication
- **Smart Auth:** Enhanced authentication features
- **Permission Handler:** Device permissions management

### File Handling
- **File Picker:** File selection and picking
- **Image Picker:** Image selection from gallery/camera

### Utilities
- **Intl:** Internationalization and localization
- **UUID:** Unique identifier generation
- **Flutter Toast:** Toast notifications
- **Flutter Dotenv:** Environment variable management
- **Equatable:** Value equality comparison
- **Meta:** Metadata annotations

## 5. Getting Started

### Prerequisites

- **Flutter SDK:** Version 3.8.1 or higher
- **Dart SDK:** Compatible with Flutter version
- **IDE:** VS Code, Android Studio, or any Flutter-compatible editor
- **Device/Emulator:** Android emulator, iOS simulator, or physical device
- **Firebase Project:** Configured Firebase project with necessary services

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd savetaxindia
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase:**
   - Add `google-services.json` to `android/app/`
   - Configure Firebase in your project console
   - Enable Authentication, Firestore, and App Check services

4. **Set up environment variables:**
   - Create a `.env` file in the root directory
   - Add necessary API keys and configuration

5. **Run the app:**
   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### Android
- Minimum SDK: 21
- Target SDK: 34
- Ensure Google Services are properly configured

#### iOS
- Minimum iOS version: 12.0
- Configure iOS-specific Firebase settings
- Set up Apple Developer account for distribution

## 6. Key Features Implementation

### Authentication Flow
1. **Splash Screen:** App initialization and loading
2. **Login Check:** Verify user authentication status
3. **Phone Auth:** Phone number input and verification
4. **OTP Verification:** One-time password validation
5. **Loading Data:** User data synchronization
6. **Home Screen:** Main application interface

### Tax Calculation Process
1. **Employment Type Selection:** Choose user employment category
2. **Tax Year Selection:** Select assessment year
3. **Income Input:** Enter various income sources
4. **Deduction Input:** Add applicable deductions
5. **Calculation:** Process tax computation using ICAI guidelines
6. **Dashboard:** Display comprehensive tax summary

### Social Features
- **Feed Management:** Create, view, and interact with posts
- **User Profiles:** Complete profile management with follow/unfollow
- **Notifications:** Real-time notification system
- **Bookmarks:** Save and organize content

## 7. Data Models

### User Model
- User identification and authentication
- Profile information (name, username, bio, location)
- Social features (followers, following)
- Profile images and banners
- Account creation and modification timestamps

### Feed Model
- Post content and metadata
- User interactions (likes, comments, shares)
- Media attachments
- Timestamp and engagement metrics

### Tax Models
- Income data structures
- Deduction information
- Calculation results
- Assessment year data

## 8. API Integration

### Firebase Services
- **Authentication:** Phone number and OTP-based auth
- **Firestore:** Real-time database for user data and content
- **App Check:** Security and abuse prevention

### Local Storage
- **Hive:** Fast local data storage
- **Shared Preferences:** Simple key-value storage
- **ObjectBox:** High-performance local database

## 9. Security Considerations

- **Firebase App Check:** Prevents unauthorized API access
- **Secure Authentication:** Phone number verification
- **Data Encryption:** Local data encryption with Hive
- **Permission Management:** Proper device permission handling

## 10. Performance Optimization

- **Responsive Design:** Screenutil for adaptive UI
- **Image Optimization:** Efficient image loading and caching
- **Local Storage:** Fast local data access
- **Lazy Loading:** Efficient content loading

## 11. Testing

- **Widget Tests:** UI component testing
- **Unit Tests:** Business logic testing
- **Integration Tests:** End-to-end functionality testing

## 12. Deployment

### Android
- Generate signed APK or AAB
- Configure Firebase App Distribution
- Upload to Google Play Store

### iOS
- Configure iOS build settings
- Generate IPA file
- Upload to App Store Connect

## 13. Maintenance and Updates

- **Dependency Updates:** Regular Flutter and package updates
- **Firebase Updates:** Keep Firebase services current
- **Security Patches:** Regular security updates
- **Feature Updates:** Continuous feature development

## 14. Support and Documentation

- **Code Comments:** Comprehensive inline documentation
- **API Documentation:** Firebase and third-party service docs
- **User Guides:** In-app help and tutorials
- **Developer Resources:** Flutter and Dart documentation

---

*This documentation was last updated to reflect the current state of the SaveTaxIndia application, including all implemented features, dependencies, and architectural decisions. For the latest updates, please refer to the source code and commit history.* 