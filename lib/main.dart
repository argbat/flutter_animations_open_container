import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/another_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: [
          OpenContainer(
            transitionType: ContainerTransitionType.fadeThrough,
            openElevation: 4,
            tappable: false,
            openBuilder: (context, action) {
              return const AnotherPager();
            },
            closedBuilder: (context, openContainer) {
              return GestureDetector(
                onTap: () {
                  openContainer();
                },
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: const [
                      Placeholder(
                        fallbackHeight: 200,
                      ),
                      Text('Bla bla bla bla'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: OpenContainer(
        closedShape: const CircleBorder(),
        closedElevation: 6,
        closedBuilder: ((context, action) {
          return const FloatingActionButton(
            elevation: 0,
            onPressed: null,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        }),
        openBuilder: (context, action) {
          return const AnotherPager();
        },
      ),
    );
  }
}
