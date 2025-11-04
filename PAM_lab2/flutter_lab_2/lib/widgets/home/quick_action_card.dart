import 'package:flutter/material.dart';
import '../shared/custom_network_image.dart';
import '../../models/quick_action.dart';

class QuickActionCard extends StatelessWidget {
  final QuickAction action;
  final double height;
  final VoidCallback onTap;

  const QuickActionCard({
    super.key,
    required this.action,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(6),
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
          children: [
            // Imagine full width
            Expanded(
              child: CustomNetworkImage(
                imageUrl: action.image,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            // Text section
            Container(
              padding: EdgeInsets.all(height == 140 ? 12 : 10),
              child: Text(
                action.title,
                style: TextStyle(
                  fontSize: height == 140 ? 14 : 13,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
