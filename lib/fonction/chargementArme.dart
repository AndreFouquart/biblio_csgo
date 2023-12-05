import 'dart:convert';
import 'package:biblio_csgo/class/skin.dart';
import 'package:http/http.dart' as http;
import 'package:biblio_csgo/class/weapon.dart';

class WeaponApi {
  final String apiUrl;

  WeaponApi(this.apiUrl);

  Future<List<Weapon>> initListWeapon(List<Weapon> liste) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List responseBody = jsonDecode(response.body);
      for (int i = 0; i < responseBody.length; i++) {
        Weapon test = Weapon(
          responseBody[i]['category']['id'],
          responseBody[i]['category']['name'],
        );
        liste.add(test);
      }
      print("Chargement terminé !");
    } else {
      // Recupérer l'erreur de chargement et l'afficher
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
    }

    return liste;
  }
}
