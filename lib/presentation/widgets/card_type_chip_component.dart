import 'package:flutter/material.dart';

class CardTypeChip extends StatelessWidget {
  const CardTypeChip({super.key, required this.type});

  final String type;

  Color _getColor() {
    if (type.contains("Monster")) return Colors.blue;
    if (type.contains("Spell")) return Colors.green;
    if (type.contains("Trap")) return Colors.purple;
    return Colors.grey;
  }

  IconData _getIcon() {
    if (type.contains("Monster")) return Icons.flash_on;
    if (type.contains("Spell")) return Icons.auto_fix_high;
    if (type.contains("Trap")) return Icons.warning_rounded;
    return Icons.help_outline;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getIcon(), size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            type,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
