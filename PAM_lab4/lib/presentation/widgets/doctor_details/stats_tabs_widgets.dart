import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const TabButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.teal : Colors.grey,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class TabsSection extends StatefulWidget {
  final List<String> tabs;

  const TabsSection({super.key, required this.tabs});

  @override
  State<TabsSection> createState() => _TabsSectionState();
}

class _TabsSectionState extends State<TabsSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final tab = entry.value;
        return TabButton(
          label: tab,
          selected: index == selectedIndex,
          onTap: () => setState(() => selectedIndex = index),
        );
      }).toList(),
    );
  }
}

class StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class StatsSection extends StatelessWidget {
  final double rating;
  final int years;
  final int patients;

  const StatsSection({
    super.key,
    required this.rating,
    required this.years,
    required this.patients,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatItem(icon: Icons.star, value: rating.toString(), label: 'Rating'),
          StatItem(
            icon: Icons.calendar_today,
            value: '$years',
            label: 'Years Exp',
          ),
          StatItem(icon: Icons.people, value: '$patients', label: 'Patients'),
        ],
      ),
    );
  }
}
