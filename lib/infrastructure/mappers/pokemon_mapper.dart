import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/models/poke_api_pokemon_response.dart';

class PokemonMapper {
  static Pokemon pokemonResponseToEntity(Map<String, dynamic> json) {
    final pokemonModel = PokeApiPokemonResponse.fromJson(json);
    return Pokemon(
      id: pokemonModel.id,
      name: pokemonModel.name,
      spriteFront: pokemonModel.sprites.frontDefault,
    );
  }
}
