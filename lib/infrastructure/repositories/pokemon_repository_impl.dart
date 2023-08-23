import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/datasources/pokemons_datasource_impl.dart';

class PokemonsRepositoryImpl extends PokemonsRepository {
  final PokemonsDataSource dataSource;
  PokemonsRepositoryImpl({PokemonsDataSource? dataSource})
      : dataSource = dataSource ?? PokemonsDataSourceImpl();
  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return dataSource.getPokemon(id);
  }
}
