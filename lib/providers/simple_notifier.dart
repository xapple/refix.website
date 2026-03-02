import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Drop-in replacement for the removed StateProvider.
/// Holds a single value of type [T] with a [set] method.
class SimpleNotifier<T> extends Notifier<T> {
  SimpleNotifier(this._initial);
  final T _initial;

  @override
  T build() => _initial;

  void set(T value) => state = value;
}
