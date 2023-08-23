import 'package:dio/dio.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/mappers/pokemon_mapper.dart';

class PokemonsDataSourceImpl extends PokemonsDataSource {
  final Dio dio;

  PokemonsDataSourceImpl()
      : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));
  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final response = await dio.get('/pokemon/$id');
      final pokemon = PokemonMapper.pokemonResponseToEntity(response.data);
      return (pokemon, 'data obtenida correctamente');
    } catch (e) {
      return (null, 'No se pudo realizar la petición: $e');
    }
  }
}
