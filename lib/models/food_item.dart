class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imageUrl;
  final String category;
  final bool isPopular;

  const FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.category,
    this.isPopular = false,
  });
}

final List<FoodItem> sampleFoodItems = [
  const FoodItem(
    id: '1',
    name: 'Artisanal Beef Burger',
    description: 'Juicy Angus beef patty with cheddar cheese, crisp lettuce, tomato, and secret sauce on a brioche bun.',
    price: 14.99,
    rating: 4.8,
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=600&q=80',
    category: 'Burgers',
    isPopular: true,
  ),
  const FoodItem(
    id: '2',
    name: 'Margherita Supreme Pizza',
    description: 'Fresh mozzarella, San Marzano tomatoes, fresh basil leaves, and olive oil drizzle on sourdough crust.',
    price: 16.50,
    rating: 4.9,
    imageUrl: 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?auto=format&fit=crop&w=600&q=80',
    category: 'Pizza',
    isPopular: true,
  ),
  const FoodItem(
    id: '3',
    name: 'Creamy Fettuccine Alfredo',
    description: 'Rich garlic parmesan cream sauce served over handmade fettuccine pasta with fresh parsley.',
    price: 13.99,
    rating: 4.6,
    imageUrl: 'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?auto=format&fit=crop&w=600&q=80',
    category: 'Pasta',
  ),
  const FoodItem(
    id: '4',
    name: 'Spicy Street Tacos',
    description: 'Three soft corn tortillas filled with marinated grilled chicken, cilantro, onions, and spicy salsa.',
    price: 11.99,
    rating: 4.7,
    imageUrl: 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?auto=format&fit=crop&w=600&q=80',
    category: 'Mexican',
    isPopular: true,
  ),
  const FoodItem(
    id: '5',
    name: 'Fresh Avocado Power Bowl',
    description: 'Organic quinoa, sliced avocado, edamame, cherry tomatoes, and tahini dressing.',
    price: 12.49,
    rating: 4.5,
    imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=600&q=80',
    category: 'Salads',
  ),
  const FoodItem(
    id: '6',
    name: 'Grilled Salmon Steak',
    description: 'Wild-caught salmon filet grilled to perfection with lemon butter sauce and asparagus.',
    price: 21.99,
    rating: 4.9,
    imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&w=600&q=80',
    category: 'Seafood',
  ),
  const FoodItem(
    id: '7',
    name: 'Decadent Lava Cake',
    description: 'Warm chocolate cake with a molten chocolate center served with vanilla bean ice cream.',
    price: 8.99,
    rating: 4.8,
    imageUrl: 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=600&q=80',
    category: 'Desserts',
    isPopular: true,
  ),
  const FoodItem(
    id: '8',
    name: 'Iced Matcha Green Tea',
    description: 'Premium Japanese matcha whisked with oat milk and drizzled with honey over ice.',
    price: 5.99,
    rating: 4.6,
    imageUrl: 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?auto=format&fit=crop&w=600&q=80',
    category: 'Beverages',
  ),
];
