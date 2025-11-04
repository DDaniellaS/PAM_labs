import 'package:flutter/material.dart';
import 'location_card.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                const [
                      LocationCard(
                        title: 'Shahbag',
                        subtitle: 'BSSMU - Bangabandhu',
                      ),
                      LocationCard(
                        title: 'Boshundhora',
                        subtitle: 'Evercare Hospital Ltd',
                      ),
                      LocationCard(
                        title: 'Badda',
                        subtitle: 'Evercare Hospital Ltd',
                      ),
                      LocationCard(title: 'ABC', subtitle: 'City Hospital'),
                      LocationCard(title: 'CCC', subtitle: ' Medical Center'),
                      LocationCard(title: 'ASD', subtitle: ' Clinic'),
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
