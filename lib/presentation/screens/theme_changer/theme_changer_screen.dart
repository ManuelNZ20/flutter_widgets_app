import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final bool isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme changer'),
        actions: [
          IconButton(
            icon: isDarkmode?
            const Icon(Icons.dark_mode_outlined):
            const Icon(Icons.light_mode_outlined),
            onPressed: (){
              // ref.read(isDarkmodeProvider.notifier).update((stateIsDarkmode) => !stateIsDarkmode);
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            },
            ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final List<Color> colors = ref.watch( colorListProvider );
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este Color',style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value) {
            //todo:notificar el cambio en algún lugar
            ref.watch(themeNotifierProvider.notifier).changeColorIndex(index);
          },);
      },
    );
  }
}