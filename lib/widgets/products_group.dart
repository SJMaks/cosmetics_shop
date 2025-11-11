import 'package:cosmetics_shop/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:cosmetics_shop/models/product.dart';

class ProductsGroup extends StatefulWidget {
  const ProductsGroup({
    super.key,
    required this.title,
    required this.gradient,
    required this.products,
    this.categoryButtons
  });

  final String title;
  final List<Color> gradient;
  final List<Product> products;
  final List<String>? categoryButtons;

  @override
  State<StatefulWidget> createState() => _ProductsGroupState();
}

class _ProductsGroupState extends State<ProductsGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              widget.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              height: 5.0,
              width: 150.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: AlignmentGeometry.centerLeft,
                        end: AlignmentGeometry.centerRight,
                        colors: widget.gradient
                    )
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 325.0,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(product: widget.products[index]);
              },
              itemCount: widget.products.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 15.0,
                );
              },
            ),
          ),
          Builder(
            builder: (context) {
              if (widget.categoryButtons != null) {
                return SizedBox(
                  height: 150.0,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 65,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0
                    ),
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 10.0),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return OutlinedButton(
                          onPressed: () {

                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10.0)
                            ),
                            foregroundColor: Theme.of(context).colorScheme.onSurface,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.surfaceContainer
                            )
                          ),
                          child: Text(widget.categoryButtons![index])
                      );
                    },
                    itemCount: widget.categoryButtons?.length,
                  ),
                );
              }
              else {
                return SizedBox();
              }
            }
          )
        ]
    );
  }
}