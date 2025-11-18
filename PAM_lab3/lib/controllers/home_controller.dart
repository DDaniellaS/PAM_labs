import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/app_models.dart';

class HomeController extends GetxController {
  var userName = ''.obs;
  var userLocation = ''.obs;
  var profileImage = ''.obs;

  var actions = <QuickAction>[].obs;
  var specialities = <Speciality>[].obs;
  var specialists = <Specialist>[].obs;

  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    try {
      final data = await rootBundle.loadString('assets/data/app_data.json');
      final jsonData = json.decode(data);

      // Load user data
      final user = jsonData['user'];
      userName.value = user['name'];
      userLocation.value = user['location'];
      profileImage.value = user['profile_image'];

      // Load actions
      final actionsData = (jsonData['actions'] as List)
          .cast<Map<String, dynamic>>();
      actions.assignAll(
        actionsData
            .map(
              (e) => QuickAction(
                title: e['title'].toString(),
                image: e['image'].toString(),
              ),
            )
            .toList(),
      );

      // Load specialities
      final specialitiesData = (jsonData['specialities'] as List)
          .cast<Map<String, dynamic>>();
      specialities.assignAll(
        specialitiesData
            .map(
              (e) => Speciality(
                label: e['label'].toString(),
                iconName: e['icon'].toString(),
              ),
            )
            .toList(),
      );

      // Load specialists
      final specialistsData = (jsonData['specialists'] as List)
          .cast<Map<String, dynamic>>();
      specialists.assignAll(
        specialistsData
            .map(
              (e) => Specialist(
                name: e['name'].toString(),
                image: e['image'].toString(),
              ),
            )
            .toList(),
      );

      isLoaded.value = true;
    } catch (e) {
      // print('Error loading home data: $e');
    }
  }
}
