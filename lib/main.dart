import 'package:flutter/material.dart';
import 'package:task/presentation/ui/homeScreen.dart';
import 'di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ), routes: {

    HomeScreen.routeName: (_) => HomeScreen(),
    },
     initialRoute: HomeScreen.routeName,)
    ;
  }
}

