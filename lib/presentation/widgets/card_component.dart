import 'dart:ui';

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
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.cardColor.withValues(alpha: 0.85),
                  theme.cardColor.withValues(alpha: 0.65),
                ],
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen con efecto moderno
                  YugiohCardImage(yugioh: yugioh),

                  const SizedBox(width: 16),

                  // Contenido textual
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        YugiohCardTextComponent(yugioh: yugioh),
                        const SizedBox(height: 8),
                        CardTypeChip(type: yugioh.type),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
