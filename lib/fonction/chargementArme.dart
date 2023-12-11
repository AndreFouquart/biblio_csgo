import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:biblio_csgo/class/weapon.dart';

class WeaponApi {
  final String apiUrl;

  WeaponApi(this.apiUrl);

  Future<List<Weapon>> initListWeapon(List<Weapon> liste) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List responseBody = jsonDecode(response.body);
      Set<String> weaponNamesSet = <String>{};

      for (int i = 0; i < responseBody.length; i++) {
        if (responseBody[i]['weapon'] != null &&
            responseBody[i]['weapon']['name'] != null) {
          // Utilisez la méthode fromJson pour créer une instance de Weapon
          Weapon weapon = Weapon.fromJson(responseBody[i]);

          if (!weaponNamesSet.contains(weapon.name)) {
            liste.add(weapon);
            weaponNamesSet.add(weapon.name);
          }
        }
      }
      print("Chargement terminé !");
    } else {
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
    }

    return liste;
  }
}
