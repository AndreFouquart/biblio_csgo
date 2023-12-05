import 'package:biblio_csgo/class/weapon.dart';
import 'package:flutter/material.dart';
import 'fonction/chargementArme.dart';

class ListeArme extends StatefulWidget {
  const ListeArme({super.key});

  @override
  State<ListeArme> createState() => _ListeArmeState();
}

class _ListeArmeState extends State<ListeArme> {
  List<Weapon> liste = [];
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
        title: Text('CSGO TEST API'),
      ),
      body: ListView.builder(
          itemCount: liste.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text(liste[index].getName()),
              subtitle: Text(liste[index].getId()),
            );
          })),
    );
  }
}
