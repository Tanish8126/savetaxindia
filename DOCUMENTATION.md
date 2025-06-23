# SaveTaxIndia App Documentation

This document provides a comprehensive overview of the SaveTaxIndia Flutter application, including its structure, features, and setup instructions.

## 1. Project Overview

SaveTaxIndia is a mobile application built with Flutter, designed to help users manage and calculate their taxes in India. The app seems to provide features for tax calculation based on different employment types and income sources, as well as community features like a feed. It uses Firebase for backend services like authentication and data storage.

## 2. Features

Based on the project structure, the app appears to have the following features:

- **User Authentication:** Phone number-based authentication with OTP verification.
- **Tax Calculation:** Detailed tax calculation for different user profiles (e.g., salaried).
- **ICAI Module:** A dedicated module for tax calculations based on guidelines from the Institute of Chartered Accountants of India (ICAI). This includes modules for:
    - Salaries
    - House Property
    - Capital Gains
    - PGBP (Profits and Gains from Business or Profession)
- **Feed/Community:** A feature that resembles a social media feed (tweets), allowing users to post content.
- **User Profiles:** Users have profiles, can follow other users, and view followers/following lists.
- **Categories:** Content or features might be organized into categories.
- **Dashboards:** Dashboards to visualize tax-related information.

## 3. Project Structure

The project follows a feature-driven directory structure, with a clear separation of concerns.

```
savetaxindia/
├── android/            # Android specific files
├── assets/             # Images, icons, and other static assets
├── ios/                # iOS specific files
├── lib/                # Core application code
│   ├── controller/     # Business logic controllers (e.g., AuthController)
│   ├── icai/           # Tax calculation logic based on ICAI norms
│   ├── models/         # Data models (e.g., UserModel, FeedModel)
│   ├── resources/      # Data handling methods (API calls, database access)
│   ├── screens/        # UI screens for different features
│   ├── utils/          # Utility classes, constants, and helper functions
│   └── widgets/        # Reusable UI widgets
├── pubspec.yaml        # Project dependencies and metadata
└── README.md           # Original README file
```

### Key Directories in `lib/`:

- **`lib/controller`**: Contains controllers that manage the application's state and business logic (e.g., `auth_controller.dart`).
- **`lib/icai`**: This is a core module containing the logic for various tax computations. It's broken down by income heads like `salaries`, `house property`, etc.
- **`lib/models`**: Defines the data structures used throughout the application (e.g., `user_model.dart`, `chat_model.dart`).
- **`lib/resources`**: Handles data operations, such as fetching data from or posting data to a server/database.
- **`lib/screens`**: Contains the UI for different screens of the application, with each screen typically having its own subdirectory.
- **`lib/utils`**: A collection of shared resources like colors, constants, text styles, and custom widgets.
- **`lib/widgets`**: Contains common and reusable widgets used across multiple screens.

## 4. Getting Started

### Prerequisites

- Flutter SDK
- An editor like VS Code or Android Studio with the Flutter plugin.
- A configured emulator or a physical device.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd savetaxindia
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the app:**
    ```bash
    flutter run
    ```

## 5. Dependencies

The project uses the following key dependencies:

- **State Management**:
    - `flutter_bloc`: For managing state using the BLoC pattern.
    - `get`: For state management, dependency injection, and routing.
    - `provider`: For state management.
- **Firebase**:
    - `firebase_core`: To initialize Firebase.
    - `firebase_auth`: For authentication.
    - `cloud_firestore`: For using the Firestore database.
    - `firebase_app_check`: For protecting backend resources.
- **UI**:
    - `flutter_svg`: To render SVG files.
    - `carousel_slider`: A carousel slider widget.
    - `percent_indicator`: To display progress indicators.
    - `pinput`: For OTP input fields.
    - `flutter_screenutil`: For adapting UI to different screen sizes.
- **Utilities**:
    - `http`: For making HTTP requests.
    - `get_storage`: For simple key-value storage.
    - `shared_preferences`: For storing simple data.
    - `google_fonts`: For using fonts from Google Fonts.
    - `url_launcher`: For launching URLs.
    - `share_plus`: For sharing content.
- **Local Database**:
    - `hive` & `hive_flutter`: A lightweight and fast key-value database.

---
*This documentation was auto-generated.* 