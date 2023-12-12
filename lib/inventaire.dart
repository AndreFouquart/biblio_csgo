import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'class/database.dart';
import 'class/skin.dart';

class Inventaire extends StatefulWidget {
  const Inventaire({super.key});

  @override
  State<Inventaire> createState() => _InventaireState();
}

class _InventaireState extends State<Inventaire> {
  List<Skin> skin = [];

  void initState() {
    super.initState();
    chargement();
  }

  void chargement() async {
    skin = await DataBaseCSGO().afficheSkin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des skins dans votre inventaire'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: skin.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 35, 42, 48),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: skin[index].getImage(),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8.0,
                  right: 8.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.black54,
                    child: Column(children: [
                      Text(
                        skin[index].getName(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            DataBaseCSGO()
                                .deleteInventaireSkin(skin[index].getId());
                          },
                          icon: Icon(Icons.delete))
                    ]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
