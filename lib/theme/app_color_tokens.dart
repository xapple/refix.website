import 'package:flutter/material.dart';

@immutable
class AppColorTokens extends ThemeExtension<AppColorTokens> {
  const AppColorTokens(this._scheme);

  final ColorScheme _scheme;

  // ── Color tokens ──
  Color get topBarBackground => _scheme.secondaryContainer;
  Color get interactiveAccent => _scheme.primary;
  Color get onInteractiveAccent => _scheme.onPrimary;
  Color get browseCategoriesBackground => _scheme.secondaryContainer;
  Color get searchBackground => _scheme.surfaceContainerHighest;

  // ── Gradient tokens ──
  LinearGradient get headerGradient => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [_scheme.secondaryContainer, _scheme.surfaceContainerHighest],
  );

  // ── ThemeExtension plumbing ──
  @override
  AppColorTokens copyWith() => AppColorTokens(_scheme);

  @override
  AppColorTokens lerp(covariant AppColorTokens? other, double t) {
    if (other == null) return this;
    return AppColorTokens(ColorScheme.lerp(_scheme, other._scheme, t));
  }
}
