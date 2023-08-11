import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GyroscopeScreen extends ConsumerWidget {
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyróscopio'),
      ),
      body: Center(
        child: gyroscope$.when(
          data: (data) => Text(data.toString()),
          error: (error, stackTrace) => Text(
            error.toString(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}
