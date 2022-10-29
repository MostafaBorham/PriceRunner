import 'price_model.dart';

class Product {
  int id;
  String name;
  String image;
  List<Price> prices;

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.prices});

  factory Product.fromMap(Map<String, dynamic> map) => Product(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      prices: (map['prices'] as List<dynamic>)
          .map((price) => Price.fromMap(price as Map<String, dynamic>))
          .toList(),
  );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'prices': prices.map((price) => price.toMap()).toList(),
      };
}
