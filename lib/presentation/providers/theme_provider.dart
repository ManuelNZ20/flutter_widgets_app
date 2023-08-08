import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de Colores inmutables
final colorListProvider = Provider((ref) => colorList);//valores inmutables

//Un simple booleano
final isDarkmodeProvider = StateProvider<bool>((ref) => true);//mantener una pieza de estado

//Un simple entero
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme clase,estado
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier(),
);//para mantener un estado, más elaboratdo

// Controller o Notifier, mantiene un estado en particular
class ThemeNotifier extends StateNotifier<AppTheme>{
  //STATE = Estado = new AppTheme();
  ThemeNotifier():super(AppTheme());//crea una instancia de AppTheme

  void toggleDarkmode() {
    state = state.copyWith(
      isDarkmode: !state.isDarkmode
    );
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
