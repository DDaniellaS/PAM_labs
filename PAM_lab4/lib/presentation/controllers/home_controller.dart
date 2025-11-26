import 'package:get/get.dart';
import '../../data/services/api_service.dart';
import '../../data/repositories/feed_repository_impl.dart';
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
      final repo = FeedRepositoryImpl(ApiService());
      final jsonData = await repo.getFeedData();

      final user = jsonData['user'];
      userName.value = user['name'];
      userLocation.value = user['location'];
      profileImage.value = user['profile_image'];

      final actionsData = (jsonData['actions'] as List)
          .cast<Map<String, dynamic>>();
      actions.assignAll(
        actionsData.map((e) {
          return QuickAction(
            title: e['title'].toString(),
            image: e['image'].toString(),
          );
        }).toList(),
      );

      final specialitiesData = (jsonData['specialities'] as List)
          .cast<Map<String, dynamic>>();
      specialities.assignAll(
        specialitiesData.map((e) {
          return Speciality(
            label: e['name'].toString(),
            iconName: e['icon'].toString(),
          );
        }).toList(),
      );

      final specialistsData = (jsonData['specialists'] as List)
          .cast<Map<String, dynamic>>();
      specialists.assignAll(
        specialistsData.map((e) {
          return Specialist(
            name: e['name'].toString(),
            image: e['image'].toString(),
          );
        }).toList(),
      );

      isLoaded.value = true;
    } catch (e) {
      isLoaded.value = true;
    }
  }
}
