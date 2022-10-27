class Price{
  String brand;
  String price;
  bool inStock;

  Price({required this.brand, required this.price, required this.inStock});

  factory Price.fromMap(Map<String,dynamic> map)=>Price(brand: map['brand'], price: map['price'], inStock: map['inStock']);

  Map<String,dynamic> toMap()=>
      {
        'brand' : brand,
        'price' : price,
        'inStock' : inStock,
      };
}