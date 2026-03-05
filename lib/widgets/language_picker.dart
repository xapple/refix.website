import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../providers/locale_provider.dart';

/// Material 3 menu for switching between English and French.
class LanguagePicker extends ConsumerStatefulWidget {
  const LanguagePicker({super.key, this.size = 29});

  final double size;

  @override
  ConsumerState<LanguagePicker> createState() => _LanguagePickerState();
}

class _LanguagePickerState extends ConsumerState<LanguagePicker> {
  final _controller = MenuController();

  static const _languages = [
    (Locale('en'), '🇬🇧 English'),
    (Locale('fr'), '🇫🇷 Français'),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final accent = Color.lerp(colorScheme.primary, colorScheme.secondary, 0.5)!;
    final current = ref.watch(localeProvider);

    return MenuAnchor(
      controller: _controller,
      alignmentOffset: const Offset(0, 4),
      menuChildren: [
        for (final (locale, label) in _languages)
          MenuItemButton(
            onPressed: () {
              ref.read(localeProvider.notifier).set(locale);
              _controller.close();
            },
            leadingIcon: locale == current
                ? const Icon(Icons.check, size: 18)
                : const SizedBox(width: 18),
            child: Text(label),
          ),
      ],
      child: IconButton(
        onPressed: () =>
            _controller.isOpen ? _controller.close() : _controller.open(),
        tooltip: 'Language',
        icon: PhosphorIcon(
          PhosphorIconsBold.globe,
          color: accent,
          size: widget.size,
        ),
      ),
    );
  }
}
