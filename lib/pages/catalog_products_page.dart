import 'package:cosmetics_shop/models/catalog_category.dart';
import 'package:cosmetics_shop/widgets/app_navigation_bar.dart';
import 'package:cosmetics_shop/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'catalog_filters_page.dart';

class CatalogProductsPage extends StatefulWidget {
  const CatalogProductsPage({super.key, required this.subcategory});

  final CatalogSubcategory subcategory;

  @override
  State<StatefulWidget> createState() => _CatalogProductsPageState();
}

enum ProductEffectsFilter {
  cleansing('Очищение'),
  moisturizing('Увлажнение'),
  regeneration('Регенерация');
  final String name;
  const ProductEffectsFilter(this.name);
}

class _CatalogProductsPageState extends State<CatalogProductsPage> {
  ProductEffectsFilter? _filter = ProductEffectsFilter.cleansing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(currentRouteIndex: 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child:
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: IconButton(
                  onPressed: () {
                    final navigator = Navigator.of(context);
                    navigator.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              widget.subcategory.listTitle,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w500,

              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '28 продуктов',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20.0
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final navigator = Navigator.of(context);
                    navigator.push(
                        MaterialPageRoute(
                            builder: (context) => CatalogFiltersPage()
                        )
                    );
                  },
                  icon: Icon(Icons.tune),
                  color: Theme.of(context).colorScheme.onSurface,
                )
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
            child: ListView.separated(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FilledButton(
                  onPressed: () {
                    setState(() {
                      _filter = ProductEffectsFilter.values[index];
                    });
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: _filter == ProductEffectsFilter.values[index]
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.surfaceContainer,
                    foregroundColor: _filter == ProductEffectsFilter.values[index]
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.onSurface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                  child: Text(
                    ProductEffectsFilter.values[index].name
                  )
                );
              },
              itemCount: ProductEffectsFilter.values.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10.0,
                );
              },
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10.0),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 315.0
              ),
              itemBuilder: (context, index) {
                return Expanded(
                  child: ProductCard(
                    product: widget.subcategory.products[index]
                  ),
                );
              },
              itemCount: widget.subcategory.products.length,
            ),
          )
        ],
      ),
    );
  }
}