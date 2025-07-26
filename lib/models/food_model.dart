class FoodModel {
  final String id;
  final String name;
  final String country;
  final String description;
  final List<String> ingredients;
  final bool halal;
  final String imageUrl;
  final double price;
  final int amountAvailable;

  FoodModel({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.ingredients,
    required this.halal,
    required this.imageUrl,
    required this.price,
    required this.amountAvailable,
  });
}
