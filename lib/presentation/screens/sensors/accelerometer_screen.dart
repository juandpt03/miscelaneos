import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accelerometer$ = ref.watch(accelerometerUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acelerómetro'),
      ),
      body: Center(
        child: accelerometer$.when(
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
