import 'package:cosmetics_shop/models/product.dart';

abstract class CatalogCategoryAbstract {
  const CatalogCategoryAbstract({
    required this.itemTitle,
    required this.listTitle,
    this.itemIcon
  });

  final String itemTitle;
  final String listTitle;
  final String? itemIcon;
}

class CatalogCategory extends CatalogCategoryAbstract {
  const CatalogCategory({
    required super.itemTitle,
    required super.listTitle,
    super.itemIcon,
    required this.subcategories
  });

  final List<CatalogCategoryAbstract> subcategories;
}

class CatalogSubcategory extends CatalogCategoryAbstract {
  const CatalogSubcategory({
    required super.itemTitle,
    required super.listTitle,
    super.itemIcon,
    required this.products
  });

  final List<Product> products;
}