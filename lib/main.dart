import 'package:dailysales/landingpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Sales App',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(color:Colors.green),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: Colors.green),
          focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Color(0xffa2e4a9)),
      ),
      ),
      
      ),
      home: const LandingPage(),
    );
  }
}
