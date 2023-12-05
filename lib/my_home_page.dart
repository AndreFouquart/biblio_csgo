import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'fonction/chargementSkin.dart';
import 'class/skin.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Skin> skins = [];

  @override
  void initState() {
    super.initState();
    _chargeSkins();
  }

  Future<void> _chargeSkins() async {
    final api = CSGOApi('https://bymykel.github.io/CSGO-API/api/fr/skins.json');
    final chargementSkins = await api.initArme(skins);
    setState(() {
      skins = chargementSkins;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSGO TEST API'),
      ),
      body: ListView.builder(
          itemCount: skins.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text(skins[index].getName()),
              subtitle: Text(skins[index].getRarity()),
              leading: CachedNetworkImage(
                imageUrl: skins[index].getImage(),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}