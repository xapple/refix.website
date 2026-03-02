import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refix_website/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: RefixApp()));
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('View Font Palette'), findsOneWidget);
    expect(find.text('View Color Palette'), findsOneWidget);
  });
}
