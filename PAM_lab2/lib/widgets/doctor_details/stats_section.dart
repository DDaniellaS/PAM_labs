import 'package:flutter/material.dart';
import 'stat_item.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatItem(
            icon: Icons.star,
            value: '4.3',
            label: 'Rating & Review',
            iconColor: Colors.amber,
          ),
          Container(width: 1, height: 30, color: Colors.grey.shade300),
          StatItem(
            icon: Icons.calendar_today,
            value: '14',
            label: 'Years of work',
          ),
          Container(width: 1, height: 30, color: Colors.grey.shade300),
          StatItem(icon: Icons.people, value: '125', label: 'No. of patients'),
        ],
      ),
    );
  }
}
