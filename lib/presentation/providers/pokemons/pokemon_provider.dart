import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/repositories/pokemon_repository_impl.dart';

final pokemonRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl();
});

final pokemonProvider =
    FutureProvider.family<Pokemon, String>((ref, pokemonId) async {
  final (pokemon, error) =
      await ref.watch(pokemonRepositoryProvider).getPokemon(pokemonId);
  if (pokemon != null) return pokemon;
  return throw error;
});
