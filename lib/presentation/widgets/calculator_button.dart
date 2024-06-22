import 'package:calculator/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final Widget child;

  const CalculatorButton({
    super.key,
    this.onTap,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(24),
      color: color ?? context.colorScheme.primaryContainer,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
