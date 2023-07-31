import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: SizedBox(
          child: Wrap(
            spacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              const ElevatedButton(
                  onPressed: null, child: Text('Elevated Disable')),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_alarm_rounded),
                  label: const Text('Elevated Icon')),
              ElevatedButton.icon(
                onPressed: () {},
                clipBehavior: Clip.hardEdge,
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    'https://i1.sndcdn.com/artworks-r8ZzzBREDbQyquuE-RKFskw-t240x240.jpg',
                    width: 30,
                  ),
                ),
                label: const Text('MILES MORALES'),
              ),
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              FilledButton.icon(
                  onPressed: () {},
                  icon: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://i.pinimg.com/474x/c2/4b/93/c24b93d9ca0b94291368cacded0d73f1.jpg',
                        width: 30,
                      )),
                  label: const Text('Spider-Man - Filled.icon')),
              FilledButton.tonal(
                  onPressed: () {}, child: const Text('Filled.tonal')),
              FilledButton.tonalIcon(
                  onPressed: () {},
                  icon: const Icon(Icons.pie_chart_outline_rounded),
                  label: const Text('Filled.tonalIcon')),
              OutlinedButton(
                  onPressed: () {}, child: const Text('OutlinedButton')),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.terminal),
                  label: const Text('Outline icon')),
              TextButton(
                  onPressed: () {},
                  child: const Text('Text',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                      ))),
              TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal)
                ),
                  onPressed: () {},
                  icon: Icon(Icons.person),
                  label: Text('Text icon')),

                  // TODO: custom button

                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.app_registration_rounded),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(colors.primary),
                      iconColor: MaterialStatePropertyAll(colors.inversePrimary)
                    ),
                  ),

            ],
          ),
        ),
      ),
    );
  }
}
