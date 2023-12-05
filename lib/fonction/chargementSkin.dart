import 'dart:convert';
import 'package:biblio_csgo/class/skin.dart';
import 'package:http/http.dart' as http;

class CSGOApi {
  final String apiUrl;

  CSGOApi(this.apiUrl);

  Future<List<Skin>> initArme(List<Skin> liste) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List responseBody = jsonDecode(response.body);
      for (int i = 0; i < responseBody.length; i++) {
        Skin mess = Skin(
            responseBody[i]['id'],
            responseBody[i]['name'],
            responseBody[i]['description'],
            responseBody[i]['rarity']['name'],
            responseBody[i]['image']);
        liste.add(mess);
      }
      print("Chargement terminé !");
    } else {
      // Recupérer l'erreur de chargement et l'afficher
      print("Error: ${response.statusCode} - ${response.reasonPhrase}");
    }

    return liste;
  }
}
