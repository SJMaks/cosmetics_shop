import 'package:flutter/material.dart';

class SelfCareSchemeAd extends StatefulWidget {
  const SelfCareSchemeAd({
    super.key
  });

  @override
  State<StatefulWidget> createState() => _SelfCareSchemeAdState();
}

class _SelfCareSchemeAdState extends State<SelfCareSchemeAd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/selfcare_scheme.png'),
          fit: BoxFit.cover,
          opacity: 0.5
        )
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Составим схему идеального\nдомашнего ухода',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '10 вопросов о вашей коже',
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 50.0,
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
        ),
      ),
    );
  }
}