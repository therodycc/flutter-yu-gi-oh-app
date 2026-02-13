import 'package:entrevista/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Cards',
      theme: ThemeData(colorScheme: ColorScheme.light()),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
