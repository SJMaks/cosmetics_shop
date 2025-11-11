import 'package:cosmetics_shop/models/catalog_category.dart';
import 'package:cosmetics_shop/pages/catalog_products_page.dart';
import 'package:flutter/material.dart';

import '../widgets/app_navigation_bar.dart';

class CatalogFiltersPage extends StatefulWidget {
  const CatalogFiltersPage({super.key});

  @override
  State<StatefulWidget> createState() => _CatalogFiltersPageState();
}

class _CatalogFiltersPageState extends State<CatalogFiltersPage> {
  final List<(String, String)> _filters = [
    ('Тип кожи', 'Жирная'),
    ('Тип средства', 'Все'),
    ('Проблема кожи', 'Не выбрано'),
    ('Эффект средства', 'Увлажнение'),
    ('Линия косметики', 'Все')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        'Фильтры',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Сортировка',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                    ),
                    TextButton(
                        onPressed: () {

                        },
                        style: TextButton.styleFrom(
                            overlayColor: Theme.of(context).colorScheme.onSurfaceVariant,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        ),
                        child: Text(
                          'По популярности',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Theme.of(context).colorScheme.onSurfaceVariant
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: _filters.map((filter) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          filter.$1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          ),
                        ),
                        TextButton(
                          onPressed: () {

                          },
                          style: TextButton.styleFrom(
                              overlayColor: Theme.of(context).colorScheme.onSurfaceVariant,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              )
                          ),
                          child: Text(
                            filter.$2,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).colorScheme.onSurfaceVariant
                            ),
                          )
                        ),
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
            child: FilledButton(
              onPressed: () {
                final navigator = Navigator.of(context);
                navigator.pop();
              },
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                foregroundColor: Theme.of(context).colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              child: SizedBox(
                height: 60.0,
                child: Center(
                  child: Text(
                    'Применить фильтры',
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}