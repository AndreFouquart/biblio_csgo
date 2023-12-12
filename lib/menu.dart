import 'package:flutter/material.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue sur CSGO'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bienvenue sur CSGO',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Center(
            child: Image(
              width: 300,
              image: AssetImage('lib/images/agent.jpg'),
            ),
          ),
          Text(
            'Skin',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.list),
                onPressed: () {
                  Navigator.pushNamed(context, "/arme");
                }),
            IconButton(
                icon: Icon(Icons.inventory_2_outlined), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.favorite_border_outlined), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
