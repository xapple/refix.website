import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'simple_notifier.dart';

final localeProvider = NotifierProvider<SimpleNotifier<Locale>, Locale>(
  () => SimpleNotifier(const Locale('en')),
);
