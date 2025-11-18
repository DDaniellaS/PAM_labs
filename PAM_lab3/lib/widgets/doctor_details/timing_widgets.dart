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
        color: selected ? Colors.teal.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(color: selected ? Colors.teal : Colors.black),
      ),
    );
  }
}

class TimingCard extends StatelessWidget {
  final String day;
  final String time;

  const TimingCard({super.key, required this.day, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        ],
      ),
    );
  }
}

class TimingSection extends StatelessWidget {
  final List<Map<String, String>> timings;

  const TimingSection({super.key, required this.timings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Timing',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: timings.length,
            itemBuilder: (context, index) {
              final timing = timings[index];
              return TimingCard(day: timing['day']!, time: timing['time']!);
            },
          ),
        ),
      ],
    );
  }
}
