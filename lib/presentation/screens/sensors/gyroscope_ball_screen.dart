import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GyroscopeScreenBall extends ConsumerWidget {
  const GyroscopeScreenBall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gyróscopio Ball'),
        ),
        body: SizedBox.expand(
          child: gyroscope$.when(
            data: (data) => MovingBall(x: data.x, y: data.y),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}

class MovingBall extends StatelessWidget {
  final double x;
  final double y;
  const MovingBall({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    double currentXPositioned = x * screenHeight;
    double currentYPositioned = y * screenWidth;
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: (currentYPositioned - 25) + (screenWidth / 2),
          top: (currentXPositioned - 75) + (screenHeight / 2),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInQuad,
          child: const Ball(),
        ),
        Text(
          '''
x:$x
y:$y
''',
          style: const TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.indigo,
      ),
    );
  }
}
