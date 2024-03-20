import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final String tag;
  final Widget child;

  const HeroWidget(this.tag, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tag,
        child: Material(
            animationDuration: const Duration(milliseconds: 700),
            type: MaterialType.transparency,
            color: Colors.transparent,
            child: child));
  }
}
