import 'dart:async';

import 'package:flutter/material.dart';

/// A fake iOS-style status bar showing the current time and static status icons.
/// Designed to sit inside the device_frame screen area for the iPhone 16,
/// whose top safe area is 59px with the Dynamic Island centred in the middle.
class FakeIOSStatusBar extends StatefulWidget {
  const FakeIOSStatusBar({super.key});

  @override
  State<FakeIOSStatusBar> createState() => _FakeIOSStatusBarState();
}

class _FakeIOSStatusBarState extends State<FakeIOSStatusBar> {
  late DateTime _now;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;
    final hour = _now.hour.toString().padLeft(2, '0');
    final minute = _now.minute.toString().padLeft(2, '0');

    return SizedBox(
      height: 59,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Time — left of the Dynamic Island
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '$hour:$minute',
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
              ),
            ),
          ),
          // Status icons — right of the Dynamic Island
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(Icons.signal_cellular_alt, color: color, size: 16),
                const SizedBox(width: 5),
                Icon(Icons.wifi, color: color, size: 16),
                const SizedBox(width: 5),
                Icon(Icons.battery_full, color: color, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
