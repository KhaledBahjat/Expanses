## 📱 Expense Tracker App – Flutter

A simple and clean **expense tracking app** built with Flutter.
This project helps users record their daily expenses with categories and dates, and manage them easily.

### ✨ Features

* ➕ Add a new expense
* 🗑️ Delete any expense
* 🗂️ Choose from multiple categories (Food, Travel, Health, Bills, etc.)
* 📅 Select a specific date
* 🌟 Simple, user-friendly UI

---

### 🧑‍💻 Built With

* **Flutter** (UI)
* **Dart** (Logic)
* `setState()` for basic state updates
* Flutter's built-in widgets like:

  * `DropdownButton`
  * `DatePicker`
  * `ListView`
  * `Icon`

---

### 🛠️ Future Improvements

* Add **local storage** (Hive / SharedPreferences)
* Add **charts** for visualizing expenses
* Explore **state management** (Provider / Riverpod)
* Add filters (e.g., by category or date)

---
## 📂 Project Structure

```
lib/
├── models/
│   └── expense.dart
├── widgets/
│   ├── expenses.dart
│   ├── new_expanse.dart
│   ├── expenses_list.dart
│   └── expanses_item.dart
├── main.dart
```

---

### 🚀 Getting Started

1. Clone the repository:

```bash
git clone https://github.com/KhaledBahjat/Expanses.git
```

2. Navigate to the project folder:

```bash
cd expenses_app
```

3. Run the app:

```bash
flutter pub get
flutter run
```

---

### 📄 License

This project is open-source and available under the [MIT License](LICENSE).
