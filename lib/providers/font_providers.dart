import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_fonts.dart';

final titleFontProvider = StateProvider<String>((ref) => AppFonts.defaultTitleFont);
final bodyFontProvider  = StateProvider<String>((ref) => AppFonts.defaultBodyFont);
