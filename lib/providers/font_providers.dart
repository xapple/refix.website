import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_fonts.dart';
import 'simple_notifier.dart';

final titleFontProvider = NotifierProvider<SimpleNotifier<String>, String>(
  () => SimpleNotifier(AppFonts.defaultTitleFont),
);
final bodyFontProvider = NotifierProvider<SimpleNotifier<String>, String>(
  () => SimpleNotifier(AppFonts.defaultBodyFont),
);
