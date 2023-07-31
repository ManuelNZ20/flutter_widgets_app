import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        return ListTile(
          leading: Icon(
            menuItem.icon,
            color: colors.primary,
          ),
          title: Text(menuItem.title),
          subtitle: Text(menuItem.subTitle),
          trailing: Icon(Icons.arrow_forward_ios_rounded,color: colors.primary,),
          onTap: (){
            //TODO:navegar a otra pantalla
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (context) => ButtonsScreen(),)
            // );
            Navigator.pushNamed(context, menuItem.link);
          },
        );
      },
    );
  }
}
