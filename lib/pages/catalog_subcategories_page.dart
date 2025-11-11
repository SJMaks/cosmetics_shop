import 'package:cosmetics_shop/models/catalog_category.dart';
import 'package:cosmetics_shop/pages/catalog_products_page.dart';
import 'package:flutter/material.dart';

import '../widgets/app_navigation_bar.dart';

class CatalogSubcategoriesPage extends StatefulWidget {
  const CatalogSubcategoriesPage({super.key, required this.category});

  final CatalogCategory category;

  @override
  State<StatefulWidget> createState() => _CatalogSubcategoriesPageState();
}

class _CatalogSubcategoriesPageState extends State<CatalogSubcategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(currentRouteIndex: 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 75.0,
              child: Stack(
                children: [
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
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 300.0,
                      child: Text(
                        widget.category.listTitle,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15.0),
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: widget.category.subcategories.map((category) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          final navigator = Navigator.of(context);
                          if (category is CatalogSubcategory) {
                            navigator.push(
                                MaterialPageRoute(
                                    builder: (context) => CatalogProductsPage(
                                      subcategory: category,
                                    )
                                )
                            );
                          }
                          else if (category is CatalogCategory) {
                            navigator.push(
                                MaterialPageRoute(
                                    builder: (context) => CatalogSubcategoriesPage(
                                      category: category,
                                    )
                                )
                            );
                          }
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
    );
  }
}