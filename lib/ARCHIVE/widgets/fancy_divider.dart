import 'package:flutter/material.dart';

class FancyDivider extends StatelessWidget {
  final bool useDarkMode;
  FancyDivider(this.useDarkMode);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 24,
      endIndent: 24,
      color: useDarkMode ? Colors.white : Colors.grey[800],
    );
  }
}
