import 'package:flutter/material.dart';
import 'specialist_card.dart';
import '../../services/home_data_service.dart';

class SpecialistsSection extends StatelessWidget {
  const SpecialistsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final specialists = HomeDataService.getSpecialists();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Specialists',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'View all >',
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: specialists.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              return SpecialistCard(specialist: specialists[index]);
            },
          ),
        ),
      ],
    );
  }
}
