import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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

  final String apiUrl = 'https://test-api-jlbn.onrender.com/v5/feed/details';

  @override
  void onInit() {
    super.onInit();
    loadDoctorData();
  }

  Future<void> loadDoctorData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Doctor
        final doc = jsonData['doctor'];
        doctor.value = Doctor(
          id: doc['id'].toString(),
          name: doc['name'],
          speciality: doc['speciality'],
          qualification: doc['qualification'],
          imageUrl: doc['profile_image'],
          rating: (doc['rating'] ?? 0).toDouble(),
          yearsOfExperience: doc['years_of_experience'],
          numberOfPatients: doc['patients_treated'],
          consultationFee: (jsonData['appointment']['fee'] ?? 0).toDouble(),
        );

        // Appointment
        final appointment = jsonData['appointment'];
        appointmentType.value = appointment['type'];
        hospitalName.value = appointment['hospital']['name'];
        hospitalLocation.value = appointment['hospital']['location'];
        waitTime.value = appointment['hospital']['wait_time'];
        consultationFee.value = (appointment['fee'] ?? 0).toDouble();

        availableDays.assignAll(
          (appointment['available_days'] as List)
              .map((e) => Map<String, dynamic>.from(e))
              .toList(),
        );

        moreClinics.assignAll(
          (appointment['hospital']['more_clinics'] as List)
              .map(
                (e) => {
                  'name': e['name'].toString(),
                  'location': e['location'].toString(),
                },
              )
              .toList(),
        );

        // Timing
        timings.assignAll(
          (jsonData['timing'] as List)
              .map(
                (e) => {
                  'day': e['day'].toString(),
                  'time': e['time'].toString(),
                },
              )
              .toList(),
        );

        // Locations
        locations.assignAll(
          (jsonData['locations'] as List)
              .map(
                (e) => {
                  'title': e['area'].toString(),
                  'subtitle': e['hospital'].toString(),
                },
              )
              .toList(),
        );

        // Tabs
        tabs.assignAll((jsonData['tabs'] as List).cast<String>());

        isLoaded.value = true;
      } else {
        throw Exception('Failed to load doctor details');
      }
    } catch (e) {
      print('Error loading doctor data: $e');
      isLoaded.value = false;
    }
  }
}
