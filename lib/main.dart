
import 'package:flutter/material.dart';
import 'eskull/formpage.dart';
import 'eskull/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pendaftaran Eskul',
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/homepage': (context) => const Homepage(),
        '/formpage': (context) => const Formpage(),
     
      
      },
    );
  }
}