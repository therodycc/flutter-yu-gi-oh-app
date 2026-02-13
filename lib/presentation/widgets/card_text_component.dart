import 'package:entrevista/domain/entities/yugioh_card.dart';
import 'package:flutter/material.dart';

class YugiohCardTextComponent extends StatelessWidget {
  const YugiohCardTextComponent({super.key, required this.yugioh});

  final YugiohCard yugioh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      yugioh.name,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: -0.2,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
