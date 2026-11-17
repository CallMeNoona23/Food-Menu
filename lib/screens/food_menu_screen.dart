import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../widgets/food_card.dart';

class FoodMenuScreen extends StatefulWidget {
  final ThemeMode currentThemeMode;
  final VoidCallback onToggleTheme;

  const FoodMenuScreen({
    super.key,
    required this.currentThemeMode,
    required this.onToggleTheme,
  });

  @override
  State<FoodMenuScreen> createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen> {
  String selectedCategory = 'All';

  List<String> get categories {
    final list = ['All'];
    for (var item in sampleFoodItems) {
      if (!list.contains(item.category)) {
        list.add(item.category);
      }
    }
    return list;
  }

  List<FoodItem> get filteredItems {
    if (selectedCategory == 'All') {
      return sampleFoodItems;
    }
    return sampleFoodItems
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  void _showItemSnackBar(String itemName) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName added to your cart!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.currentThemeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.restaurant_menu, color: Colors.white),
            SizedBox(width: 8),
            Text('Gourmet Food Menu'),
          ],
        ),
        actions: [
          // Theme switch button in AppBar
          IconButton(
            tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: anim,
                child: child,
              ),
              child: Icon(
                isDark ? Icons.wb_sunny : Icons.nightlight_round,
                key: ValueKey(isDark),
                color: Colors.white,
              ),
            ),
            onPressed: widget.onToggleTheme,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Category Filter Horizontal Scrollable Bar
            Container(
              height: 54,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = cat == selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedCategory = cat;
                          });
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            // Responsive Body using LayoutBuilder
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth >= 600;

                  if (filteredItems.isEmpty) {
                    return const Center(
                      child: Text('No food items found in this category.'),
                    );
                  }

                  if (isWideScreen) {
                    // GridView for wider screens (tablets, desktop, phone landscape)
                    final int crossAxisCount = constraints.maxWidth >= 900 ? 3 : 2;
                    final double aspectRatio = constraints.maxWidth >= 900 ? 1.05 : 0.92;

                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: aspectRatio,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return FoodCard(
                          item: item,
                          isGrid: true,
                          onTap: () => _showItemSnackBar(item.name),
                          onAddToCart: () => _showItemSnackBar(item.name),
                        );
                      },
                    );
                  } else {
                    // ListView for mobile portrait screens
                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 12),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return FoodCard(
                          item: item,
                          isGrid: false,
                          onTap: () => _showItemSnackBar(item.name),
                          onAddToCart: () => _showItemSnackBar(item.name),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
