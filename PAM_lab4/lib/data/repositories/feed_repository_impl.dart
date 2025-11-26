// Data Layer
import '../../domain/repositories/feed_repository.dart';
import '../services/api_service.dart';

class FeedRepositoryImpl implements FeedRepository {
  final ApiService apiService;

  FeedRepositoryImpl(this.apiService);

  @override
  Future<Map<String, dynamic>> getFeedData() async {
    return await apiService.getFeed();
  }

  @override
  Future<Map<String, dynamic>> getDoctorDetailsData() async {
    return await apiService.getDoctorDetails();
  }
}