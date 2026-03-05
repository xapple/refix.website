import 'package:flutter/material.dart';

@immutable
class AppColorTokens extends ThemeExtension<AppColorTokens> {
  const AppColorTokens({
    required this.topBarBackground,
    required this.interactiveAccent,
    required this.onInteractiveAccent,
    required this.splashHeaderGradientTop,
    required this.splashHeaderGradientBottom,
    required this.browseCategoriesBackground,
  });

  final Color topBarBackground;
  final Color interactiveAccent;
  final Color onInteractiveAccent;
  final Color splashHeaderGradientTop;
  final Color splashHeaderGradientBottom;
  final Color browseCategoriesBackground;

  factory AppColorTokens.fromColorScheme(ColorScheme cs) {
    return AppColorTokens(
      topBarBackground: cs.secondaryContainer,
      interactiveAccent: cs.primary,
      onInteractiveAccent: cs.onPrimary,
      splashHeaderGradientTop: cs.secondaryContainer,
      splashHeaderGradientBottom: cs.surfaceContainerHighest,
      browseCategoriesBackground: cs.secondaryContainer,
    );
  }

  @override
  AppColorTokens copyWith({
    Color? topBarBackground,
    Color? interactiveAccent,
    Color? onInteractiveAccent,
    Color? splashHeaderGradientTop,
    Color? splashHeaderGradientBottom,
    Color? browseCategoriesBackground,
  }) {
    return AppColorTokens(
      topBarBackground: topBarBackground ?? this.topBarBackground,
      interactiveAccent: interactiveAccent ?? this.interactiveAccent,
      onInteractiveAccent: onInteractiveAccent ?? this.onInteractiveAccent,
      splashHeaderGradientTop:
          splashHeaderGradientTop ?? this.splashHeaderGradientTop,
      splashHeaderGradientBottom:
          splashHeaderGradientBottom ?? this.splashHeaderGradientBottom,
      browseCategoriesBackground:
          browseCategoriesBackground ?? this.browseCategoriesBackground,
    );
  }

  @override
  AppColorTokens lerp(ThemeExtension<AppColorTokens>? other, double t) {
    if (other is! AppColorTokens) {
      return this;
    }
    return AppColorTokens(
      topBarBackground: Color.lerp(
        topBarBackground,
        other.topBarBackground,
        t,
      )!,
      interactiveAccent: Color.lerp(
        interactiveAccent,
        other.interactiveAccent,
        t,
      )!,
      onInteractiveAccent: Color.lerp(
        onInteractiveAccent,
        other.onInteractiveAccent,
        t,
      )!,
      splashHeaderGradientTop: Color.lerp(
        splashHeaderGradientTop,
        other.splashHeaderGradientTop,
        t,
      )!,
      splashHeaderGradientBottom: Color.lerp(
        splashHeaderGradientBottom,
        other.splashHeaderGradientBottom,
        t,
      )!,
      browseCategoriesBackground: Color.lerp(
        browseCategoriesBackground,
        other.browseCategoriesBackground,
        t,
      )!,
    );
  }
}
