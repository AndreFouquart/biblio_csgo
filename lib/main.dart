import 'package:biblio_csgo/class/database.dart';
import 'package:biblio_csgo/inventaire.dart';
import 'package:biblio_csgo/listeArme.dart';
import 'package:biblio_csgo/menu.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DataBaseCSGO().initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 28, 33, 39),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 35, 42, 48)),
      home: const MenuPrincipal(),
      routes: {
        '/route': (context) => const MenuPrincipal(),
        '/arme': (BuildContext context) => const ListeArme(),
        '/inventaire': (BuildContext context) => const Inventaire()
      },
      initialRoute: '/route',
    );
  }
}
