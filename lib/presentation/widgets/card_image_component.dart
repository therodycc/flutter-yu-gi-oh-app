import 'package:entrevista/domain/entities/yugioh_card.dart';
import 'package:flutter/material.dart';

class YugiohCardImage extends StatelessWidget {
  const YugiohCardImage({super.key, required this.yugioh, this.imageSize = 120});

  final double imageSize;
  final YugiohCard yugioh;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.12),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          yugioh.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(
                Icons.broken_image_rounded,
                size: 48,
                color: Colors.grey,
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              color: Colors.grey[200],
              child: const Center(
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
