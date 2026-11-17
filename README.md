# Responsive Food Menu App 🍔🍕

A modern, responsive, and themeable Flutter application built to demonstrate clean architecture, custom widget composition (`Stack`, `Row`, `Column`, `Expanded`), responsive design (`ListView` vs `GridView`), custom light and dark themes, and collaborative Git workflow.

---

## 🌟 Key Features

1. **Responsive Layout (`LayoutBuilder` & `MediaQuery`)**:
   - **Phones / Portrait Mode (`width < 600`)**: Displays food items in a vertical `ListView`.
   - **Tablets / Wide Screens / Landscape (`width >= 600`)**: Displays food items in a responsive multi-column `GridView`.
   - **No Overflow Guarantee**: Utilizes `SafeArea`, `TextOverflow.ellipsis`, flexible aspect ratios, and flex sizing to ensure 0 layout overflow warnings across all device sizes and orientations.

2. **Custom Reusable `FoodCard` Widget**:
   Built using explicit Flutter layout primitives:
   - 🥞 **`Stack`**: Overlays rating badges (`★ 4.8`) and status tags (`POPULAR` / `HOT`) directly over food image thumbnails.
   - 📐 **`Row`**: Horizontally aligns details, price, rating icons, and cart action buttons.
   - 🧱 **`Column`**: Vertically stacks category labels, food titles, descriptions, and price/action rows.
   - ↔️ **`Expanded`**: Flexibly allocates space to text elements to gracefully prevent text clipping and pixel overflow.

3. **Custom Light & Dark `ThemeData` & Toggle**:
   - **Light Theme**: Vibrant Crimson Red (`#E53935`) primary, clean grey background (`#F8F9FA`), custom typography (`Roboto`), and card shadows.
   - **Dark Theme**: Warm Coral (`#FF7043`) primary, sleek dark surface (`#1E1E1E`), adapted text styles, and subtle dark card shadows.
   - **Interactive Switcher**: One-tap toggle button in the `AppBar` to dynamically switch between Light and Dark modes.

4. **Category Filtering**:
   - Horizontal category chips (All, Burgers, Pizza, Pasta, Mexican, Salads, Seafood, Desserts, Beverages) for instant menu filtering.

---

## 🛠️ Project Structure

```
lib/
├── main.dart                  # Main entry point with ThemeMode state management
├── models/
│   └── food_item.dart         # FoodItem model & mock dataset
├── theme/
│   └── app_theme.dart         # Light & Dark ThemeData definitions with custom typography
├── widgets/
│   └── food_card.dart         # Reusable FoodCard using Stack, Row, Column, Expanded
└── screens/
    └── food_menu_screen.dart  # Responsive Food Menu Screen (ListView & GridView)
```

---

## 🔀 Collaborative Git Workflow & Branch History

This project was developed collaboratively using feature-branching, meaningful commit messages (following Conventional Commits format), and Merged Pull Requests:

### Branch & Pull Request Summary

| Branch Name | Feature Description | Author | Merged Pull Request |
|-------------|---------------------|--------|---------------------|
| `feature/custom-theme` | Defined Light & Dark `ThemeData` with custom colors & typography | Developer 1 | **PR #1**: Merged into `main` |
| `feature/food-card-widget` | Created reusable `FoodCard` widget using `Stack`, `Row`, `Column`, `Expanded` | Developer 2 | **PR #2**: Merged into `main` |
| `feature/responsive-food-menu` | Implemented responsive `FoodMenuScreen` (`ListView` for mobile, `GridView` for tablets) | Developer 1 | **PR #3**: Merged into `main` |

---

## 🚀 How to Run the Project

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd lab_exam
   ```

2. **Get dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

4. **Inspect Git History**:
   ```bash
   git log --graph --oneline --all
   ```
