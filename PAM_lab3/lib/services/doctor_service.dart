import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/app_models.dart';

class DoctorService {
  static Future<Doctor> getDoctor() async {
    final jsonString = await rootBundle.loadString('assets/data/app_data.json');
    final data = json.decode(jsonString);
    final doc = data['doctorDetails']['doctor'];

    return Doctor(
      id: doc['id'],
      name: doc['name'],
      speciality: doc['speciality'],
      qualification: doc['qualification'],
      imageUrl: doc['image'],
      rating: (doc['rating'] as num).toDouble(),
      yearsOfExperience: doc['years_of_experience'],
      numberOfPatients: doc['patients_treated'],
      consultationFee: (doc['consultation_fee'] as num).toDouble(),
    );
  }
}
