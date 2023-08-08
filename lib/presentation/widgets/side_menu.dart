import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key,required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    // print(hasNotch);
    // if(Platform.isAndroid) {
    //   print('Android $hasNotch');
    // }else {
    //   print('IOS $hasNotch');
    // }
    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
            child: const Text('Main'),
          ),
          ...appMenuItems
              .sublist(0, 3) //de 0 a 3 elementos
              .map(
                (menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon),
                  label: Text(menuItem.title),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Text('More Option'),
          ),
          ...appMenuItems
              .sublist(3) //de 0 a 3 elementos
              .map(
                (menuItem) => NavigationDrawerDestination(
                  icon: Icon(menuItem.icon),
                  label: Text(menuItem.title),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
        ]);
  }
}
