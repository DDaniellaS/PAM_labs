import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/app_models.dart';

class DoctorController extends GetxController {
  var doctor = Rxn<Doctor>();
  var isLoaded = false.obs;
  var locations = <Map<String, String>>[].obs;
  var timings = <Map<String, String>>[].obs;
  var tabs = <String>[].obs;
  var stats = <String, dynamic>{}.obs;

  var appointmentType = ''.obs;
  var hospitalName = ''.obs;
  var hospitalLocation = ''.obs;
  var waitTime = ''.obs;
  var consultationFee = 0.0.obs;
  var availableDays = <Map<String, dynamic>>[].obs;
  var moreClinics = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDoctorData();
  }

  Future<void> loadDoctorData() async {
    try {
      final data = await rootBundle.loadString('assets/data/app_data.json');
      final jsonData = json.decode(data);
      final details = jsonData['doctorDetails'];

      // Load doctor data
      final doc = details['doctor'];
      doctor.value = Doctor(
        id: doc['id'],
        name: doc['name'],
        speciality: doc['speciality'],
        qualification: doc['qualification'],
        imageUrl: doc['image'],
        rating: doc['rating'].toDouble(),
        yearsOfExperience: doc['years_of_experience'],
        numberOfPatients: doc['patients_treated'],
        consultationFee: doc['consultation_fee'].toDouble(),
      );

      // Load locations
      final locationsData = (details['locations'] as List)
          .cast<Map<String, dynamic>>();
      locations.assignAll(
        locationsData
            .map(
              (loc) => {
                'title': loc['title'].toString(),
                'subtitle': loc['subtitle'].toString(),
              },
            )
            .toList(),
      );

      // Load timings
      final timingsData = (details['timing'] as List)
          .cast<Map<String, dynamic>>();
      timings.assignAll(
        timingsData
            .map(
              (time) => {
                'day': time['day'].toString(),
                'time': time['time'].toString(),
              },
            )
            .toList(),
      );

      // Load tabs
      tabs.assignAll((details['tabs'] as List).cast<String>());

      // Load stats
      stats.value = Map<String, dynamic>.from(details['stats']);

      // Load appointment data
      final appointment = details['appointment'];
      appointmentType.value = appointment['type'];
      hospitalName.value = appointment['hospital']['name'];
      hospitalLocation.value = appointment['hospital']['location'];
      waitTime.value = appointment['hospital']['wait_time'];
      consultationFee.value = doctor.value?.consultationFee ?? 0.0;

      // Load available days
      final daysData = (appointment['available_days'] as List)
          .cast<Map<String, dynamic>>();
      availableDays.assignAll(daysData);

      // Load more clinics
      final clinicsData = (appointment['hospital']['more_clinics'] as List)
          .cast<Map<String, dynamic>>();
      moreClinics.assignAll(
        clinicsData
            .map(
              (clinic) => {
                'name': clinic['name'].toString(),
                'location': clinic['location'].toString(),
              },
            )
            .toList(),
      );

      isLoaded.value = true;
    } catch (e) {
      //print('Error loading doctor data: $e');
    }
  }
}
