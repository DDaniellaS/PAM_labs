import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BorderRadius? borderRadius;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
      ),
    );
  }
}
