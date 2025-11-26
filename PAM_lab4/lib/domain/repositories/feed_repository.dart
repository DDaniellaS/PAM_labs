abstract class FeedRepository {
  Future<Map<String, dynamic>> getFeedData();
  Future<Map<String, dynamic>> getDoctorDetailsData();
}
