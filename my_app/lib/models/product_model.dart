class ProductModel {
  final String id;
  final String name;
  final int price;
  final String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
    );
  }

  @override
  // Wajib untuk Cubit agar objek produk dengan ID yang sama diperlakukan sama
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}