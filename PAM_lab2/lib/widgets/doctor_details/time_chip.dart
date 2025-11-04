import 'package:flutter/material.dart';

class TimeChip extends StatelessWidget {
  final String label;
  final bool selected;

  const TimeChip({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFB2DFDB) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: selected ? const Color(0xFFB2DFDB) : Colors.grey.shade300,
          width: selected ? 0 : 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.teal.shade800 : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
