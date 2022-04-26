import 'package:statemanagement/api_route/api_rout.dart';
import 'package:statemanagement/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  static Future pokemonGet() async {
    http.Response response = await http.get(
      Uri.parse(ApiRoute.pokemonUri),
    );
    if (response.statusCode == 200) {
      var pokemonData = response.body;
      return pokemonModelFromJson(pokemonData);
    }
  }
}
