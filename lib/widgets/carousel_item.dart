import 'package:flutter/material.dart';

class CarouselItem extends StatefulWidget {
  const CarouselItem({
    super.key,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    this.button
  });

  final String backgroundImage;
  final String title;
  final String subTitle;
  final Widget? button;

  @override
  State<StatefulWidget> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: AssetImage(widget.backgroundImage),
          fit: BoxFit.cover,
        ),
        DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(200),
                      Colors.black.withAlpha(0),
                    ]
                )
            )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    widget.title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.subTitle,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18.0
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (widget.button != null) {
                          return Flexible(
                            flex: 0,
                            child: widget.button!
                          );
                        }
                        else {
                          return SizedBox();
                        }
                      }
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}