import 'package:entrevista/domain/entities/yugioh_card.dart';
import 'package:entrevista/presentation/widgets/card_image_component.dart';
import 'package:entrevista/presentation/widgets/card_text_component.dart';
import 'package:entrevista/presentation/widgets/card_type_chip_component.dart';
import 'package:flutter/material.dart';

class YugiohCardComponent extends StatelessWidget {
  final YugiohCard yugioh;

  const YugiohCardComponent({super.key, required this.yugioh});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            YugiohCardImage(yugioh: yugioh),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 200,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black,
                      Colors.black54,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YugiohCardTextComponent(yugioh: yugioh),
                  const SizedBox(height: 6),
                  CardTypeChip(type: yugioh.type),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
