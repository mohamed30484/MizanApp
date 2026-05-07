Mizan App
Project Overview

Mizan App is a mobile finance management application built using Flutter and Dart. The project focuses on providing a clean Arabic-first user experience for organizing monthly expenses and tracking financial data.

The app allows users to:
-Store personal financial information
-Organize expenses based on salary percentages
-Manage installment plans
-Convert currencies
-Persist user data locally
-Track and display installment records dynamically

The project demonstrates practical Flutter development concepts including:
-Stateful and Stateless widgets
-Local storage management
-SQLite database integration
-Custom reusable widgets
-Responsive UI design
-Navigation and screen management
-Form validation

Tech Stack
Technology	Purpose
Flutter	Cross-platform mobile framework
Dart	Main programming language
Sqflite	Local SQLite database management
Shared Preferences	Persistent local key-value storage
Path	Database path management
Material Design	UI components and styling

Main Dependencies
dependencies:
  flutter:
    sdk: flutter
  sqflite:
  shared_preferences:
  path:
  intl:

  Architecture
The project follows a simple modular Flutter architecture with clear separation of responsibilities.

Architecture Layers
1. Screens Layer
Contains all application pages and user interaction logic.
Examples:
-Login Screen
-Installments Screen
-Currency Exchange Screen
-Expenses Organization Screen
-Personal Information Screen

2. Widgets Layer
Contains reusable UI components used across multiple screens.
Examples:
-Custom text fields
-Animated percentage indicators
-Menu cards
-Installments table widgets

3. Core Layer
Contains utilities, constants, and local database helpers.
Examples:
-Shared Preferences helper
-SQLite database helper
-App constants
-Screen size utilities

4. Models Layer
Contains data models used to map and manage application data.
Example:
InstallmentsModel

Features
User Registration & Local Persistence
-Save user profile information locally
-Store salary and bank balance
-Persist data using Shared Preferences

Expense Organization
-Divide expenses into categories using salary percentages
-Animated circular progress indicators
-Dynamic financial calculations

Installments Management
-Add installment records
-Update installments
-Delete installments
-Store installments in SQLite database
-Display installment tables dynamically

Currency Exchange
-Convert between currencies
-User-friendly conversion interface
-Real-time calculation logic inside the app

Responsive UI
-Adaptive sizing using MediaQuery
-Mobile-friendly layouts
-Arabic RTL support

Reusable Components
-Modular widget structure
-Reusable containers and form fields
-Clean separation between UI and logic

Testing
The project currently includes Flutter testing support through:
dev_dependencies:
  flutter_test:
    sdk: flutter

Existing Testing Capabilities
-Widget testing
-UI rendering validation
-Form interaction testing

Suggested Future Tests
-Database CRUD testing
-State management testing
-Integration testing
-Performance testing
-Responsive layout testing

Folder Structure
lib/
│
├── core/
│   ├── constants/
│   ├── database/
│   │   ├── cache_helper.dart
│   │   └── sqflite.dart
│   └── utils/
│
├── models/
│   └── installments_model.dart
│
├── screens/
│   ├── currency_exchange_screans.dart
│   ├── installments_screen.dart
│   ├── login_screen.dart
│   ├── mizan_menu.dart
│   ├── oraganize_expenses.dart
│   └── personal_info_screen.dart
│
├── widgets/
│   ├── custom_container_expense1.dart
│   ├── custom_container_expenses2.dart
│   ├── custom_container_expenses3.dart
│   ├── custom_installments_table.dart
│   ├── custom_mizanmenu_container.dart
│   ├── custom_precent_circle_avatar.dart
│   └── custom_textformfield.dart
│
└── main.dart

How to Run the Project
Prerequisites
Make sure you have installed:
- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android Emulator or physical device

Clone the Repository
[git clone https://github.com/your-username/mizan_app.git](https://github.com/mohamed30484/MizanApp.git)
cd mizan_app

Install Dependencies
flutter pub get

Run the Application
flutter run

Build APK
flutter build apk

Future Improvements
The project has strong potential for future expansion.
- Planned Enhancements
- Firebase Authentication
- Cloud database synchronization
- Expense analytics dashboard
- Charts and financial insights
- Dark mode support
- Multi-language support
- Export financial reports
- Notification reminders for installments
- Secure authentication system
- Improved architecture using Provider, Bloc, or Riverpod
- REST API integration for live currency exchange rates

Screenshots
Add your application screenshots here.
assets/screenshots/
├── login.png
├── home.png
├── installments.png
├── expenses.png
└── currency_exchange.png

Example
![Login Screen](assets/screenshots/login.png)
![Home Screen](assets/screenshots/home.png)
![Expenses Screen](assets/screenshots/expenses.png)

Database Structure
Installments Table
CREATE TABLE Installments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  monthlyinstallment REAL,
  dateTime TEXT,
  comments TEXT
);

UI & Design Notes
The application uses:
- Custom reusable widgets
- Animated circular indicators
- Arabic-friendly interface
- Material Design principles
- Responsive layouts for multiple screen sizes

Performance Notes
The project uses lightweight local storage solutions:
- SharedPreferences for simple persistent data
- Sqflite for structured local database storage

This makes the app:
- Fast
- Offline-friendly
- Lightweight
- Easy to maintain

Social Links
GitHub: [https://github.com/your-username](https://github.com/mohamed30484)
Email: mohamedabdelaziz9@gmail.com

Contributing
Contributions are welcome.
If you'd like to improve the project:
- Fork the repository
- Create a new branch
- Commit your changes
- Push to your branch
- Open a Pull Request

License
This project is open-source and available under the MIT License.

Author
Developed with Flutter and Dart as a practical finance management application project.

I analyzed the project structure, screens, widgets, database layer, storage system, and overall architecture, then generated a professional GitHub-ready README.md for the project.

