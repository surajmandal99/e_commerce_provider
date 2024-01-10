class Product {
  final String name;
  final String image;
  final String description;
  final double price;
  final String category;
  // final double rating;
  final int id;
  int quantity;

  Product({
    required this.category,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    // required this.rating,
    required this.id,
    required this.quantity,
  });
}
