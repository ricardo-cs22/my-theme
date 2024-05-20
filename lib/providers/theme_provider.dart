import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:thema_seu_amigo/models/theme_model.dart';
import 'package:thema_seu_amigo/screens/home_page.dart';

class ThemeProvider extends StatelessWidget {
  final ThemeModel themeModel = ThemeModel();

  ThemeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeModel,
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
