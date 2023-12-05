import 'package:biblio_csgo/listeArme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255,28,33,39),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255,35,42,48)
      ),
      home: ListeArme(),
    );
  }
}
