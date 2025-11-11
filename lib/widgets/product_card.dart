import 'dart:ui';

import 'package:cosmetics_shop/models/product.dart';
import 'package:cosmetics_shop/utils/formatter.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<StatefulWidget> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 170.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(10)
              ),
              child: SizedBox(
                height: 200.0,
                width: 170.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center.add(Alignment(0.25, 0.25)),
                      child: SizedBox(
                        height: 175.0,
                        width: 125.0,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Image(
                            image: AssetImage('assets/images/products/${widget.product.imageName}.png'),
                            color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(200),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 175.0,
                        width: 125.0,
                        child: Image(
                          image: AssetImage('assets/images/products/${widget.product.imageName}.png'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Builder(
                              builder: (context) {
                                if (widget.product.oldPrice != null) {
                                  return Image(
                                    image: AssetImage('assets/images/icons/promotion.png'),
                                  );
                                }
                                return SizedBox();
                              }
                            ),
                            Builder(
                              builder: (context) {
                                switch (widget.product.promotionTypeID) {
                                  case 1:
                                    return Image(
                                      image: AssetImage('assets/images/icons/1_plus_1.png'),
                                    );
                                  default:
                                    return SizedBox();
                                }
                              }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]
                )
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              widget.product.productType.name,
              style: TextStyle(
                fontSize: 14.0
              ),
            ),
            SizedBox(
              height: 40.0,
              child: Text(
                widget.product.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.fade,
                  height: 1.25
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  '${formatPrice(widget.product.price)} ₽',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (widget.product.oldPrice != null) {
                      return Text(
                        ' ${formatPrice(widget.product.oldPrice!)} ₽',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Theme.of(context).colorScheme.onSurfaceVariant,
                          overflow: TextOverflow.fade
                        ),
                      );
                    }
                    else {
                      return SizedBox();
                    }
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}