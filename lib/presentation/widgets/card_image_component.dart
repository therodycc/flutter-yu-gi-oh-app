import 'package:entrevista/domain/entities/yugioh_card.dart';
import 'package:flutter/material.dart';

class YugiohCardImage extends StatelessWidget {
  const YugiohCardImage({
    super.key,
    required this.yugioh,
    this.imageSize = 120,
  });

  final double imageSize;
  final YugiohCard yugioh;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.network(
        yugioh.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.grey[300],
          child: const Icon(Icons.broken_image_rounded, size: 40),
        ),
      ),
    );
  }
}
