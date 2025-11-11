import 'package:cosmetics_shop/models/catalog_category.dart';
import 'package:cosmetics_shop/pages/catalog_subcategories_page.dart';
import 'package:cosmetics_shop/widgets/self_care_scheme_ad.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/app_navigation_bar.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<StatefulWidget> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<CatalogCategory> _categories = [
    CatalogCategory(
      itemTitle: 'Назначение',
      listTitle: 'По назначению',
      subcategories: []
    ),
    CatalogCategory(
      itemTitle: 'Тип средства',
      listTitle: 'По типу средства',
      subcategories: []
    ),
    CatalogCategory(
      itemTitle: 'Тип кожи',
      listTitle: 'По типу кожи',
      subcategories: [
        CatalogSubcategory(
          itemTitle: 'Жирная',
          listTitle: 'Средства\nдля жирной кожи',
          products: [
            Product(
              productType: ProductType.serum,
              name: 'Unstress Total Serenity Serum',
              imageName: 'product1',
              price: 10195
            ),
            Product(
                productType: ProductType.tonic,
                name: 'Unstress Revitalizing Toner',
                imageName: 'product2',
                price: 3095
            ),
            Product(
                productType: ProductType.serum,
                name: 'Unstress Total Serenity Serum',
                imageName: 'product1',
                price: 10195
            ),
            Product(
                productType: ProductType.tonic,
                name: 'Unstress Revitalizing Toner',
                imageName: 'product2',
                price: 3095
            ),
          ]
        ),
        CatalogSubcategory(
          itemTitle: 'Комбинированная',
          listTitle: 'Средства\nдля комбинированной кожи',
            products: []
        ),
        CatalogSubcategory(
          itemTitle: 'Нормальная',
          listTitle: 'Средства\nдля нормальной кожи',
          products: []
        ),
        CatalogSubcategory(
          itemTitle: 'Сухая',
          listTitle: 'Средства\nдля сухой кожи',
          products: []
        ),
        CatalogSubcategory(
          itemTitle: 'Любой тип',
          listTitle: 'Средства\nдля кожи любого типа',
          products: []
        ),
      ]
    ),
    CatalogCategory(
      itemTitle: 'Линия косметики',
      listTitle: 'По линии косметики',
      subcategories: []
    ),
    CatalogCategory(
      itemTitle: 'Наборы',
      listTitle: 'Наборы',
      subcategories: []
    ),
    CatalogCategory(
      itemTitle: 'Акции',
      listTitle: 'Акции',
      itemIcon: 'assets/images/icons/promotion_pink.png',
      subcategories: []
    ),
    CatalogCategory(
      itemTitle: 'Консультация\nс косметологом',
      listTitle: 'Консультации',
      subcategories: []
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(currentRouteIndex: 1),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                    prefixIconConstraints: BoxConstraints(
                        minWidth: 0.0,
                        minHeight: 0.0
                    ),
                    hintText: 'Поиск',
                    hintStyle: TextStyle(
                        fontSize: 20.0
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onSurfaceVariant
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface
                        )
                    ),

                  ),
                  cursorColor: Theme.of(context).colorScheme.onSurface,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 5.0, vertical: 15.0),
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      children: _categories.map((category) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              final navigator = Navigator.of(context);
                              navigator.push(
                                MaterialPageRoute(
                                  builder: (context) => CatalogSubcategoriesPage(
                                    category: category,
                                  )
                                )
                              );
                            },
                            style: TextButton.styleFrom(
                                overlayColor: Theme.of(context).colorScheme.onSurfaceVariant,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                )
                            ),
                            child: Row(
                              children: [
                                Text(
                                  category.itemTitle,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.onSurface
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    if (category.itemIcon != null) {
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Image(
                                          image: AssetImage(category.itemIcon!),
                                        ),
                                      );
                                    }
                                    else {
                                      return SizedBox();
                                    }
                                  }
                                )
                              ],
                            )
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 200.0,
              child: SelfCareSchemeAd()
            ),
          )
        ]
      ),
    );
  }
}