# SaveTaxIndia App Documentation

This document provides a comprehensive overview of the SaveTaxIndia Flutter application, including its structure, features, and setup instructions.

## 1. Project Overview

SaveTaxIndia is a mobile application built with Flutter, designed to help users manage and calculate their taxes in India. The app provides features for tax calculation based on different employment types and income sources, community features like a feed, and professional assistance. It uses Firebase for backend services like authentication and data storage.

## 2. Features

- **User Authentication:** Phone number-based authentication with OTP verification.
- **Tax Calculation:** Detailed tax calculation for different user profiles (e.g., salaried).
- **ICAI Module:** Dedicated module for tax calculations based on guidelines from the Institute of Chartered Accountants of India (ICAI), including:
    - Salaries
    - House Property
    - Capital Gains
    - PGBP (Profits and Gains from Business or Profession)
- **Feed/Community:** Social media-like feed (tweets), allowing users to post content.
- **User Profiles:** Users have profiles, can follow other users, and view followers/following lists.
- **Categories:** Content and features organized into categories.
- **Dashboards:** Dashboards to visualize tax-related information.
- **Hire Expert:** Users can browse and hire tax professionals (e.g., Chartered Accountants, Tax Lawyers, Consultants) directly from the app. Each expert type is presented with a description and a 'Hire' button. A floating action button provides quick access to chat/help.
- **Income Tax Act Browser:** Users can browse all 298 sections of the Income Tax Act, 1961, with section numbers and titles. The data is modularized for maintainability.
- **Tax Year Selection:** Modern UI for selecting a tax year, with a 2x2 grid of years, selection highlight, and a clear call-to-action.

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

- **`lib/controller`**: Application state and business logic controllers.
- **`lib/icai`**: Core tax computation logic, organized by income head.
- **`lib/models`**: Data structures (e.g., user, chat, feed models).
- **`lib/resources`**: Data operations (API/database access).
- **`lib/screens`**: UI for all features, each in its own subdirectory.
- **`lib/utils`**: Shared resources (colors, constants, text styles, helpers).
- **`lib/widgets`**: Common, reusable widgets.
- **`lib/screens/hire_expert_screen`**: UI and logic for hiring tax professionals.
- **`lib/screens/resouces_screen/components/income_tax_act`**: Modularized data and UI for browsing all sections of the Income Tax Act, 1961.

## 4. UI/UX Improvements

- **Modern Tax Year Selection:** Clean, user-friendly screen for choosing a tax year, with a 2x2 grid, selection highlight, and a clear sign-up button.
- **Hire Expert Screen:** Professionally designed cards for each expert type, with icons, descriptions, and a 'Hire' button. Includes a floating action button for chat/help.
- **Income Tax Act Browser:** Efficiently displays all 298 sections using a modular data approach for performance and maintainability.

## 5. Getting Started

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

## 6. Dependencies

The project uses the following key dependencies:

- **State Management**:
    - `flutter_bloc`: BLoC pattern for state management.
    - `get`: State management, dependency injection, and routing.
    - `provider`: State management.
- **Firebase**:
    - `firebase_core`: Firebase initialization.
    - `firebase_auth`: Authentication.
    - `cloud_firestore`: Firestore database.
    - `firebase_app_check`: Backend resource protection.
- **UI**:
    - `flutter_svg`: SVG rendering.
    - `carousel_slider`: Carousel slider widget.
    - `percent_indicator`: Progress indicators.
    - `pinput`: OTP input fields.
    - `flutter_screenutil`: Responsive UI.
- **Utilities**:
    - `http`: HTTP requests.
    - `get_storage`: Simple key-value storage.
    - `shared_preferences`: Simple data storage.
    - `google_fonts`: Google Fonts integration.
    - `url_launcher`: Launching URLs.
    - `share_plus`: Content sharing.
- **Local Database**:
    - `hive` & `hive_flutter`: Lightweight key-value database.

---
*This documentation was auto-generated and last updated to reflect the latest features, including expert hiring and Income Tax Act browsing.* 