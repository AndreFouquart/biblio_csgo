import 'package:biblio_csgo/class/weapon.dart';
import 'package:biblio_csgo/skinArme.dart';
import 'package:flutter/material.dart';
import 'fonction/chargementArme.dart';
import 'fonction/chargementSkins.dart';

class ListeArme extends StatefulWidget {
  const ListeArme({super.key});

  @override
  State<ListeArme> createState() => _ListeArmeState();
}

class _ListeArmeState extends State<ListeArme> {
  List<Weapon> liste = [];
  @override
  void initState() {
    super.initState();
    _chargeArmes();
  }

  Future<void> _chargeArmes() async {
    final api =
        WeaponApi('https://bymykel.github.io/CSGO-API/api/fr/skins.json');
    final chargementArmes = await api.initListWeapon(liste);
    setState(() {
      liste = chargementArmes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSGO TEST API'),
      ),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () async {
              final skinApi = SkinApi(
                  'https://bymykel.github.io/CSGO-API/api/fr/skins.json');
              final skins =
                  await skinApi.getSkinsForWeapon(liste[index].getId());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArmeDetailPage(
                    armeName: liste[index].getName(),
                    skins: skins,
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(
                liste[index].getName(),
                style: const TextStyle(
                  color: Colors.white, // Changer la couleur du texte à blanc
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
