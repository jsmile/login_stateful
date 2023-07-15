import 'package:flutter/material.dart';
import '/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Basic Stateful Form',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
