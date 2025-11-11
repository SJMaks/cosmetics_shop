import 'package:cosmetics_shop/widgets/carousel_item.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key, required this.items});

  final List<CarouselItem> items;

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int activePage = 0;

  List<Widget> indicators(imagesLength,currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white.withAlpha(100),
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, index) {
              return widget.items[index];
            },
            itemCount: widget.items.length,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                children: indicators(widget.items.length, activePage)
            ),
          )
        ]
      ),
    );
  }
}