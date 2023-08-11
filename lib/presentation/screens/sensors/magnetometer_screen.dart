import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnetometer$ = ref.watch(magnetometerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetómetro'),
      ),
      body: Center(
        child: magnetometer$.when(
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
