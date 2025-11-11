class Product {
  const Product({
    required this.productType,
    required this.name,
    required this.imageName,
    required this.price,
    this.oldPrice,
    this.promotionTypeID
  });

  final ProductType productType;
  final String name;
  final String imageName;
  final double price;
  final double? oldPrice;
  final int? promotionTypeID;
}

enum ProductType {
  serum('Сыворотка'),
  tonic('Тоник'),
  cream('Крем'),
  brighteningMask('Осветляющая маска');
  final String name;
  const ProductType(this.name);
}