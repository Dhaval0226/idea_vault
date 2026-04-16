# 🧠 Idea Vault (Flutter + Hive)

## 📌 Project Overview

Idea Vault is a modern Flutter application designed to help users capture, organize, and manage their ideas efficiently. The app provides a clean and interactive UI with a dynamic bento grid layout, allowing users to store ideas in either text or checklist format.

This project demonstrates the implementation of local database storage using Hive along with full CRUD operations and an engaging user interface.

---

## 🚀 Features

* 🔐 User Login System (session-based, no database storage)
* 🧩 Dynamic Bento Grid layout for ideas
* ➕ Create and manage ideas easily
* 📋 Support for:

  * Text-based notes
  * Checklist-based items
* ⭐ Mark ideas as favorites
* 🗑️ Edit and delete ideas (CRUD operations)
* 🎨 Random pastel colors for visually appealing cards
* 📂 Drawer menu with:

  * All Ideas
  * Favorites
* 👤 Profile screen displaying user details
* 💾 Local storage using Hive (fast & efficient)

---

## 🛠️ Technologies Used

* Flutter (Dart)
* Hive (Local Database)
* flutter_staggered_grid_view (Bento Grid Layout)
* Material UI Components

---

## 📱 Application Flow

1. **Login Screen**

   * User enters Name, Age, Email, Gender
   * Selects avatar (👨 👩 🤖 🐶)
   * Data used for session only

2. **Home Screen**

   * Displays all ideas in a bento grid
   * Drawer menu for navigation
   * Profile icon for user details
   * Floating button to create new idea

3. **Idea Screen**

   * Create/Edit idea
   * Add multiple items
   * Toggle between text or checklist mode
   * Mark as favorite

---

## 📂 Project Structure

lib/
├── models/
│   └── idea.dart
├── screens/
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── idea_screen.dart
│   └── profile_screen.dart
├── main.dart

---

## 📸 Screenshots

(Add your screenshots here)

![Login Screen](images/login.png)
![Home Screen - Bento Grid](images/home.png)
![Idea Screen](images/idea.png)
![Profile Screen](images/profile.png)

---

## 🎥 Video Demo

<!-- Paste your demo video link below -->

<!-- Example: https://your-video-link.com -->

---

## ▶️ How to Run the Project

1. Clone the repository
2. Open in Android Studio / VS Code
3. Run the following command:

flutter pub get

4. Launch the app:

flutter run

---

## 🎯 Assignment Objectives Covered

✔ Local database implementation using Hive
✔ CRUD operations (Create, Read, Update, Delete)
✔ Dynamic UI with grid layout
✔ Form-based input handling
✔ Navigation between multiple screens
✔ Clean and responsive user interface

---

## 💡 Future Enhancements

* 🔍 Search functionality for ideas
* 🏷️ Tag-based categorization
* ☁️ Cloud sync (Firebase)
* 🌙 Dark mode
* 📊 Analytics for idea usage

---

## 👨‍💻 Author

Developed by: Dhaval

---

## 📌 Conclusion

Idea Vault is a user-friendly and visually appealing application that showcases the practical implementation of local storage, UI/UX design, and structured data management in Flutter. It reflects real-world application development practices and serves as a strong portfolio project.

---
