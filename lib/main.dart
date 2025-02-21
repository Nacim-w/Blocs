import 'package:bloc_shop_app/app_blocs.dart';
import 'package:bloc_shop_app/app_events.dart';
import 'package:bloc_shop_app/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBlocs(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
          child: BlocBuilder<AppBlocs, AppStates>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "${BlocProvider.of<AppBlocs>(context).state.counter}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        );
      })),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
