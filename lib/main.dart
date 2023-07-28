import 'package:flu_gym/data/exercise.dart';
import 'package:flu_gym/index.dart';
import 'package:flu_gym/model/exercise_model.dart';
import 'package:flu_gym/pages/exercise_detail_page.dart';
import 'package:flu_gym/pages/exercise_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  _toggleIsFavourite(ExerciseModel exerciseModel){
    ExerciseModel model = exerciseList
              .firstWhere((element) => element.name == exerciseModel.name);

          setState(() {
            model.isFavourite = !model.isFavourite;
          });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(255, 111, 44, 200),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color.fromARGB(255, 112, 111, 111)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 111, 44, 200),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const Index(),
        ExerciseListPage.routeName: (context) => const ExerciseListPage(),
        ExerciseDetailPage.routeName: (context) => ExerciseDetailPage(toggleFavourite: _toggleIsFavourite),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
