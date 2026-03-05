import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Material 3 dropdown navigation menu triggered by the hamburger icon.
class NavMenu extends StatefulWidget {
  const NavMenu({super.key, this.size = 30});

  final double size;

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  final _controller = MenuController();

  static const _items = [
    (PhosphorIconsBold.house, 'Home', '/'),
    (PhosphorIconsBold.palette, 'Colors', '/colors'),
    (PhosphorIconsBold.textAa, 'Fonts', '/fonts'),
  ];

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.tertiary;
    final location = GoRouterState.of(context).uri.path;

    return MenuAnchor(
      controller: _controller,
      alignmentOffset: const Offset(0, 4),
      menuChildren: [
        for (final (icon, label, path) in _items)
          MenuItemButton(
            onPressed: () {
              _controller.close();
              context.go(path);
            },
            leadingIcon: PhosphorIcon(icon, size: 20),
            trailingIcon: location == path
                ? const Icon(Icons.check, size: 18)
                : const SizedBox(width: 18),
            child: Text(label),
          ),
      ],
      child: IconButton(
        onPressed: () =>
            _controller.isOpen ? _controller.close() : _controller.open(),
        tooltip: 'Menu',
        icon: PhosphorIcon(
          PhosphorIconsBold.list,
          color: accent,
          size: widget.size,
        ),
      ),
    );
  }
}
