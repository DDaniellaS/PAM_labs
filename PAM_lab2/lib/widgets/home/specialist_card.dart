import 'package:flutter/material.dart';
import '../shared/custom_network_image.dart';
import '../../models/specialist.dart';

class SpecialistCard extends StatelessWidget {
  final Specialist specialist;

  const SpecialistCard({super.key, required this.specialist});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                CustomNetworkImage(
                  imageUrl: specialist.image,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Text section
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              specialist.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
