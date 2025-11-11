import 'package:flutter/material.dart';

class SelfCareSchemeMain extends StatefulWidget {
  const SelfCareSchemeMain({
    super.key
  });

  @override
  State<StatefulWidget> createState() => _SelfCareSchemeMainState();
}

class _SelfCareSchemeMainState extends State<SelfCareSchemeMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/selfcare_scheme.png'),
          fit: BoxFit.cover,
          opacity: 0.5
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15.0),
            child: Text(
              'Моя схема домашнего ухода',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: 135.0,
              child: Builder(
                builder: (context) {
                  final List<(String, String)> categories = [
                    ('Демакияж', 'assets/images/products/product1.png'),
                    ('Очищение', 'assets/images/products/product2.png'),
                    ('Сыворотка', 'assets/images/products/product3.png'),
                    ('Дневной крем', 'assets/images/products/product4.png'),
                  ];
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: SizedBox(
                                width: 100.0,
                                height: 100.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Image(
                                    image: AssetImage(categories[index].$2),
                                    alignment: AlignmentGeometry.topCenter,
                                    fit: BoxFit.fitWidth,
                                    color: Theme.of(context).colorScheme.surfaceContainer,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              categories[index].$1,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: categories.length,
                  );
                }
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    'Ответьте на 10 вопросов, \nи мы подберем нужный уход',
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: FilledButton(
                    onPressed: () {

                    },
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5.0)
                        ),
                        backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: Text(
                      'Пройти тест'
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}