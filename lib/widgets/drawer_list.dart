import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:thema_seu_amigo/models/theme_model.dart';

class DrawerList extends StatelessWidget {
  void _openColorPicker(BuildContext context, Function(Color) callback) {
    Color currentColor =
        Provider.of<ThemeModel>(context, listen: false).backgroundColor;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escolher Cor'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: callback,
              showLabel: false,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeModel>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: themeChanger.backgroundColor,
            ),
            child: Text(
              'Opções',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Cor do Background'),
            onTap: () {
              _openColorPicker(context, themeChanger.changeBackgroundColor);
            },
          ),
          ListTile(
            title: Text('Cor dos Ícones'),
            onTap: () {
              _openColorPicker(context, themeChanger.changeIconColor);
            },
          ),
          ListTile(
            title: Text('Cor do Texto'),
            onTap: () {
              _openColorPicker(context, themeChanger.changeTextColor);
            },
          ),
          ListTile(
            title: Text('Cor da Barra Inferior'),
            onTap: () {
              _openColorPicker(context, themeChanger.changeBottomNavBarColor);
            },
          ),
          ListTile(
            title: Text('Compartilhar Cores do Tema'),
            onTap: () {
              themeChanger.shareThemeColors();
            },
          ),
        ],
      ),
    );
  }
}
