import 'package:flutter/material.dart';
import '../models/food_item.dart';

/// A reusable custom Food Card widget designed using:
/// - Stack (image with overlaid rating badge & popular tag)
/// - Row (horizontal alignment of details, price, and action buttons)
/// - Column (vertical stacking of category, title, description, and price row)
/// - Expanded (ensures flexible space allocation without overflow)
class FoodCard extends StatelessWidget {
  final FoodItem item;
  final bool isGrid;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  const FoodCard({
    super.key,
    required this.item,
    this.isGrid = false,
    this.onTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (isGrid) {
      return _buildGridCard(context, theme);
    } else {
      return _buildListCard(context, theme);
    }
  }

  /// Builds Card for Grid Layout using Stack, Column, Row, and Expanded
  Widget _buildGridCard(BuildContext context, ThemeData theme) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. STACK: Overlays rating badge and popular tag on top of food image
            Stack(
              children: [
                _buildImageContainer(height: 120, width: double.infinity),
                if (item.isPopular)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'POPULAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xB3000000),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          item.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 2. EXPANDED & COLUMN: Flexible vertical layout for details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.category.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.name,
                          style: theme.textTheme.titleLarge?.copyWith(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.description,
                          style: theme.textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    // 3. ROW & EXPANDED: Horizontal arrangement of price and action button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onAddToCart,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds Card for List Layout using Stack, Row, Column, and Expanded
  Widget _buildListCard(BuildContext context, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              // 1. STACK: Image thumbnail with badge overlay
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _buildImageContainer(height: 100, width: 100),
                  ),
                  if (item.isPopular)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'HOT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              // 2. EXPANDED & COLUMN: Fills available horizontal width smoothly
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.category.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 14),
                                  const SizedBox(width: 2),
                                  Text(
                                    item.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.name,
                            style: theme.textTheme.titleLarge?.copyWith(fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item.description,
                            style: theme.textTheme.bodyMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      // 3. ROW & EXPANDED: Bottom price and action area
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: onAddToCart,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            icon: const Icon(Icons.shopping_bag_outlined, size: 14),
                            label: const Text('Add', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper widget for loading network image with placeholder fallback
  Widget _buildImageContainer({required double height, required double width}) {
    return SizedBox(
      height: height,
      width: width,
      child: Image.network(
        item.imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey.shade300,
            child: const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.amber.shade100,
            child: const Center(
              child: Icon(
                Icons.fastfood,
                size: 36,
                color: Colors.deepOrange,
              ),
            ),
          );
        },
      ),
    );
  }
}
