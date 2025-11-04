import 'package:flutter/material.dart';
import 'timing_card.dart';

class TimingSection extends StatelessWidget {
  const TimingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Timing',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                const [
                      TimingCard(day: 'Monday', time: '09:00 AM - 05:00 PM'),
                      TimingCard(day: 'Tuesday', time: '09:00 AM - 05:00 PM'),
                      TimingCard(day: 'Wednesday', time: '09:00 AM - 05:00 PM'),
                      TimingCard(day: 'Thursday', time: '09:00 AM - 05:00 PM'),
                      TimingCard(day: 'Friday', time: '09:00 AM - 05:00 PM'),
                      TimingCard(day: 'Saturday', time: '10:00 AM - 02:00 PM'),
                      TimingCard(day: 'Sunday', time: 'Closed'),
                    ]
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: e,
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
