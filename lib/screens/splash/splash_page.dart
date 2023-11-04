import 'package:flutter/material.dart';
import 'package:nbu_api/screens/bloc_example/bloc_example.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    goNext();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BlocExample(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Splash Page"),
    ));
  }
}
