import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'simple_notifier.dart';

final themeModeProvider =
    NotifierProvider<SimpleNotifier<ThemeMode>, ThemeMode>(
      () => SimpleNotifier(ThemeMode.system),
    );
