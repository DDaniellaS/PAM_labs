import 'package:flutter/material.dart';
import 'speciality_item.dart';
import '../../services/home_data_service.dart';

class SpecialitiesSection extends StatelessWidget {
  const SpecialitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final specialities = HomeDataService.getSpecialities();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Specialities most relevant to you',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: specialities.length,
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            itemBuilder: (_, index) {
              return SpecialityItem(speciality: specialities[index]);
            },
          ),
        ),
      ],
    );
  }
}
