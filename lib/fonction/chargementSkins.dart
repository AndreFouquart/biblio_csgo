import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:biblio_csgo/class/skin.dart';

class SkinApi {
  final String apiUrl;

  SkinApi(this.apiUrl);

  Future<List<Skin>> getSkinsForWeapon(String weaponId) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List responseBody = jsonDecode(response.body);
      List<Skin> skins = [];

      for (int i = 0; i < responseBody.length; i++) {
        if (responseBody[i]['weapon'] != null &&
            responseBody[i]['weapon']['id'] == weaponId) {
          Skin skin = Skin.fromJson(responseBody[i]);
          skins.add(skin);
        }
      }
      return skins;
    } else {
      // Gérez l'erreur de chargement et affichez un message approprié
      throw Exception('Failed to load skins');
    }
  }
}
