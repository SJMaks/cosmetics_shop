import 'package:cosmetics_shop/pages/main_page.dart';
import 'package:cosmetics_shop/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appThemeLight,
      darkTheme: appThemeDark,
      themeMode: ThemeMode.light,
      home: const MainPage(),
    );
  }
}