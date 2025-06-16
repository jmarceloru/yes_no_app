import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.yellow,
  Colors.red
];

class AppTheme{
  ThemeData theme(int position){
    ThemeData themeData;
    try{
      themeData =ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[position]
    );
    }catch(ex){
      throw Exception("No se pudo establecer el theme");
    }
    return themeData;
  }
}