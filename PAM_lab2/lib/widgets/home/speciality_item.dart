import 'package:flutter/material.dart';
import '../../models/speciality.dart';

class SpecialityItem extends StatelessWidget {
  final Speciality speciality;

  const SpecialityItem({super.key, required this.speciality});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F3F7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(speciality.icon, color: Colors.teal, size: 28),
          ),
          const SizedBox(height: 6),
          Text(
            speciality.label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
