import 'package:cosmetics_shop/widgets/app_navigation_bar.dart';
import 'package:cosmetics_shop/widgets/carousel_item.dart';
import 'package:cosmetics_shop/widgets/categories_list.dart';
import 'package:cosmetics_shop/widgets/carousel.dart';
import 'package:cosmetics_shop/widgets/products_group.dart';
import 'package:cosmetics_shop/widgets/self_care_scheme_main.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppNavigationBar(currentRouteIndex: 0),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Carousel(
                items: [
                  CarouselItem(
                    backgroundImage: 'assets/images/background/serum.png',
                    title: 'Скидка -15%',
                    subTitle: 'Сыворотка\nHA EYE & NECK SERUM',
                    button: OutlinedButton(
                      onPressed: () {

                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(2.5)
                          ),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                          )
                      ),
                      child: Text(
                        'Перейти к акции',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    ),
                  ),
                  CarouselItem(
                    backgroundImage: 'assets/images/categories/category3.png',
                    title: 'Скидка -20%',
                    subTitle: 'Крем для лица',
                  ),
                  CarouselItem(
                    backgroundImage: 'assets/images/categories/category4.png',
                    title: 'Акция 1+1',
                    subTitle: 'Крем для тела\nUnstress Revitalizing Toner',
                    button: OutlinedButton(
                      onPressed: () {

                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(2.5)
                          ),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                          )
                      ),
                      child: Text(
                        'Перейти к акции',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: CategoriesList(
                  categories: [
                    ('Наборы', 'assets/images/categories/category1.png'),
                    ('Для лица', 'assets/images/categories/category2.png'),
                    ('Для глаз', 'assets/images/categories/category3.png'),
                    ('Для тела', 'assets/images/categories/category4.png'),
                    ('Умывание', 'assets/images/categories/category5.png'),
                  ]
                ),
              ),
              ProductsGroup(
                title: 'Новинки',
                gradient: [
                  Color(0xffe4fef9),
                  Color(0xff66f6dc),
                ],
                products: [
                  Product(
                      productType: ProductType.serum,
                      name: 'Unstress Total Serenity Serum',
                      imageName: 'product1',
                      price: 10195,
                  ),
                  Product(
                      productType: ProductType.tonic,
                      name: 'Unstress Revitalizing Toner',
                      imageName: 'product2',
                      price: 3095,
                  ),
                  Product(
                      productType: ProductType.tonic,
                      name: 'Unstress Revitalizing Toner',
                      imageName: 'product2',
                      price: 3095,
                  ),
                ],
              ),
              SelfCareSchemeMain(),
              ProductsGroup(
                title: 'Акции',
                gradient: [
                  Color(0xffffc0e1),
                  Color(0xfff02980),
                ],
                products: [
                  Product(
                      productType: ProductType.serum,
                      name: 'Muse Serum Supreme',
                      imageName: 'product3',
                      price: 10195,
                      oldPrice: 10195,
                  ),
                  Product(
                      productType: ProductType.cream,
                      name: 'Unstress Revitalizing Toner',
                      imageName: 'product4',
                      price: 1595,
                      oldPrice: 3195,
                      promotionTypeID: 1
                  ),
                  Product(
                      productType: ProductType.tonic,
                      name: 'Unstress Revitalizing Toner',
                      imageName: 'product4',
                      price: 3095,
                      oldPrice: 3195,
                  ),
                ],
                categoryButtons: [
                  'Для очищения',
                  'Для увлажнения',
                  'Для питания',
                  'Для омоложения'
                ],
              ),
              ProductsGroup(
                title: 'Хиты',
                gradient: [
                  Color(0xfff86614),
                  Color(0xfffcbc5c),
                ],
                products: [
                  Product(
                      productType: ProductType.serum,
                      name: 'Forever Young- Total Renewal Serum',
                      imageName: 'product5',
                      price: 10195,
                  ),
                  Product(
                      productType: ProductType.brighteningMask,
                      name: 'Illustious Mask',
                      imageName: 'product6',
                      price: 1595,
                  ),
                  Product(
                    productType: ProductType.brighteningMask,
                    name: 'Illustious Mask',
                    imageName: 'product6',
                    price: 1595,
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}