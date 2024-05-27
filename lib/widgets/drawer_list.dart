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
          _buildListButton(
            context,
            'Cor do Background',
            () => _openColorPicker(context, themeChanger.changeBackgroundColor),
          ),
          _buildListButton(
            context,
            'Cor dos Ícones',
            () => _openColorPicker(context, themeChanger.changeIconColor),
          ),
          _buildListButton(
            context,
            'Cor do Texto',
            () => _openColorPicker(context, themeChanger.changeTextColor),
          ),
          _buildListButton(
            context,
            'Cor da Barra Inferior',
            () =>
                _openColorPicker(context, themeChanger.changeBottomNavBarColor),
          ),
          _buildListButton(
            context,
            'Compartilhar Cores do Tema',
            () => themeChanger.shareThemeColors(),
          ),
        ],
      ),
    );
  }

  Widget _buildListButton(
      BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
