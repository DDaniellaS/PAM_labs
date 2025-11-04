import 'package:flutter/material.dart';

class DoctorInfoSection extends StatelessWidget {
  const DoctorInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 45,
          backgroundImage: NetworkImage(
            'https://pic.rutubelist.ru/user/00/00/a538f80ca3c4a32f33cbbc0048347de1_78.jpg',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Dr. Emma Kathrin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 6),
              Text(
                'Cardiologist',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text('MBBS', style: TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          ),
        ),
      ],
    );
  }
}
