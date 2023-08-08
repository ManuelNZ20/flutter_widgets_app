import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de Colores inmutables
final colorListProvider = Provider((ref) => colorList);

//Un simple booleano
final isDarkmodeProvider = StateProvider<bool>((ref) => true);


//Un simple entero
final selectedColorProvider = StateProvider((ref) => 0);

