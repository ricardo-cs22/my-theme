import 'package:flutter/material.dart';
import 'package:thema_seu_amigo/models/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:thema_seu_amigo/screens/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}
