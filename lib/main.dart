import 'package:flutter/material.dart';
import 'package:nbu_api/screens/bloc_example/bloc_example.dart';
import 'package:nbu_api/service/get_it/get_it.dart';

void main() {
  setup();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const BlocExample(),
    );
  }
}
