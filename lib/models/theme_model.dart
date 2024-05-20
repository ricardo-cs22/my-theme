import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ThemeModel with ChangeNotifier {
  Color _backgroundColor = Color(0xFF1A1A2E);
  Color _iconColor = Colors.white;
  Color _textColor = Colors.white;
  Color _bottomNavBarColor = Color(0xFF1A1A2E);

  Color get backgroundColor => _backgroundColor;
  Color get iconColor => _iconColor;
  Color get textColor => _textColor;
  Color get bottomNavBarColor => _bottomNavBarColor;

  void changeBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }

  void changeIconColor(Color color) {
    _iconColor = color;
    notifyListeners();
  }

  void changeTextColor(Color color) {
    _textColor = color;
    notifyListeners();
  }

  void changeBottomNavBarColor(Color color) {
    _bottomNavBarColor = color;
    notifyListeners();
  }

  void shareThemeColors() {
    String colorToHex(Color color) =>
        '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';

    final String backgroundColorHex = colorToHex(_backgroundColor);
    final String iconColorHex = colorToHex(_iconColor);
    final String textColorHex = colorToHex(_textColor);
    final String bottomNavBarColorHex = colorToHex(_bottomNavBarColor);

    final String shareContent = '''
Cores do Tema:
- Cor do Background: $backgroundColorHex
- Cor dos Ícones: $iconColorHex
- Cor do Texto: $textColorHex
- Cor da Barra Inferior: $bottomNavBarColorHex
''';

    Share.share(shareContent);
  }
}
