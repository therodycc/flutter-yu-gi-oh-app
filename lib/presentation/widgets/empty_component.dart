import 'package:flutter/material.dart';

class EmptyComponent extends StatelessWidget {
  const EmptyComponent({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
