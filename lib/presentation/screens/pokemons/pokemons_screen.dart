import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/providers/pokemons/pokemons_list_provider.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _PokemonsView());
  }
}

class _PokemonsView extends ConsumerStatefulWidget {
  const _PokemonsView();

  @override
  ConsumerState<_PokemonsView> createState() => _PokemonsViewState();
}

class _PokemonsViewState extends ConsumerState<_PokemonsView> {
  final ScrollController scrollControler = ScrollController();
  void infiniteScroll() {
    if (ref.read(pokemonsIdsProvider).length >= 400) {
      scrollControler.removeListener(infiniteScroll);
    }
    if (scrollControler.position.pixels + 200 >=
        scrollControler.position.maxScrollExtent) {
      ref.read(pokemonsIdsProvider.notifier).update((state) => [
            ...state,
            ...List.generate(30, (index) => state.length + index + 1)
          ]);
    }
  }

  @override
  void initState() {
    super.initState();
    scrollControler.addListener(infiniteScroll);
  }

  @override
  void dispose() {
    scrollControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollControler,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        const _PokemonsGrid()
      ],
    );
  }
}

class _PokemonsGrid extends ConsumerWidget {
  const _PokemonsGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pokemonsIdsProvider);
    return SliverGrid.builder(
      itemCount: index.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => context.push('/pokemons/${index + 1}'),
        child: Image.network(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
        ),
      ),
    );
  }
}
