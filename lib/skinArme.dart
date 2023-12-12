import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:biblio_csgo/class/skin.dart';
import 'infoArme.dart';

class ArmeDetailPage extends StatelessWidget {
  final String armeName;
  final List<Skin> skins;

  const ArmeDetailPage({Key? key, required this.armeName, required this.skins})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Skins de $armeName'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: skins.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoArme(skin: skins[index]),
                  ),
                );
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 35, 42, 48),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: skins[index].getImage(),
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
                      child: Text(
                        skins[index].getName(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
