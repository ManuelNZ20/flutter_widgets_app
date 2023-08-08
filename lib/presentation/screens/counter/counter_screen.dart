import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String name = 'counter_screen';
  
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final textStyle = Theme.of(context).textTheme.titleLarge;

    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkmode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: isDarkmode?
            const Icon(Icons.dark_mode_outlined):
            const Icon(Icons.light_mode_outlined),
            onPressed: (){
              ref.read(isDarkmodeProvider.notifier).update((stateIsDarkmode) => !stateIsDarkmode);
            },
            ),
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter',style: textStyle,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // ref.read(counterProvider.notifier)
          //    .update((state) => state+1);
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),),
    );
  }
}