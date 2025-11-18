import 'package:flutter/material.dart';

// --- Quick Actions ---
class QuickAction {
  final String title;
  final String image;

  QuickAction({required this.title, required this.image});
}

// --- Specialities ---
class Speciality {
  final String label;
  final String iconName;

  Speciality({required this.label, required this.iconName});

  IconData get icon => _mapIconName(iconName);

  static IconData _mapIconName(String name) {
    switch (name) {
      case 'visibility':
        return Icons.visibility;
      case 'medical_services':
        return Icons.medical_services;
      case 'favorite':
        return Icons.favorite;
      case 'air':
        return Icons.air;
      case 'psychology':
        return Icons.psychology;
      default:
        return Icons.circle;
    }
  }
}

// --- Specialists ---
class Specialist {
  final String name;
  final String image;

  Specialist({required this.name, required this.image});
}

// --- Doctor Details ---
class Doctor {
  final String id;
  final String name;
  final String speciality;
  final String qualification;
  final String imageUrl;
  final double rating;
  final int yearsOfExperience;
  final int numberOfPatients;
  final double consultationFee;

  Doctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.qualification,
    required this.imageUrl,
    required this.rating,
    required this.yearsOfExperience,
    required this.numberOfPatients,
    required this.consultationFee,
  });
}
