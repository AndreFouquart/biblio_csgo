import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:biblio_csgo/class/skin.dart';

class ArmeDetailPage extends StatelessWidget {
  final String armeName;
  final List<Skin> skins;

  ArmeDetailPage({required this.armeName, required this.skins});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails des Skins de $armeName'),
      ),
      body: ListView.builder(
          itemCount: skins.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text(skins[index].getName()),
              leading: CachedNetworkImage(
                imageUrl: skins[index].getImage(),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          })
      ),
    );
  }
}
