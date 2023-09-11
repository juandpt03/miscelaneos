import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;

  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonProvider(pokemonId));
    return pokemon.when(
      data: (pokemon) => _PokemonView(pokemon: pokemon),
      error: (error, stackTrace) => _WidgetError(message: '$error'),
      loading: () => const PokemonLoading(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            onPressed: () {
              SharePlugin.shareLink(
                  'https://pokemon-learn-deep-linking.up.railway.app/pokemons/${pokemon.id}/',
                  'Mira esta foto');
            },
            icon: const Icon(Icons.share),
          )
        ],
      ),
      body: Center(
          child: Image.network(
        pokemon.spriteFront,
        fit: BoxFit.cover,
        height: 150,
      )),
    );
  }
}

class _WidgetError extends StatelessWidget {
  final String message;
  const _WidgetError({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class PokemonLoading extends StatelessWidget {
  const PokemonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
