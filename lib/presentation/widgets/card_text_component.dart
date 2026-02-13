import 'package:entrevista/domain/entities/yugioh_card.dart';
import 'package:flutter/material.dart';

class YugiohCardTextComponent extends StatelessWidget {
  const YugiohCardTextComponent({super.key, required this.yugioh});

  final YugiohCard yugioh;

  @override
  Widget build(BuildContext context) {
    return Text(
      yugioh.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
    );
  }
}
