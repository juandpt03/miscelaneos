import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

final gyroscopeProvider =
    StreamProvider.autoDispose<GyroscopeCoordinates>((ref) async* {
  await for (final event in gyroscopeEvents) {
    final x = double.parse((event.x.toStringAsFixed(2)));
    final y = double.parse((event.y.toStringAsFixed(2)));
    final z = double.parse((event.z.toStringAsFixed(2)));
    yield GyroscopeCoordinates(x, y, z);
  }
});

class GyroscopeCoordinates {
  final double x;
  final double y;
  final double z;

  GyroscopeCoordinates(this.x, this.y, this.z);

  @override
  String toString() {
    return '''
    x: $x
    y: $y
    z: $z
''';
  }
}
