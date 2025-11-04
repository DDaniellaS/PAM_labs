import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  final String label;
  final String slot;
  final bool selected;

  const DateChip({
    super.key,
    required this.label,
    required this.slot,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFB2DFDB) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected ? const Color(0xFFB2DFDB) : Colors.grey.shade300,
          width: selected ? 0 : 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.teal.shade800 : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            slot,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.teal.shade700 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
