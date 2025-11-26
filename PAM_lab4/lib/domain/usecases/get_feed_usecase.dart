import '../repositories/feed_repository.dart';

class GetFeedUseCase {
  final FeedRepository repository;
  GetFeedUseCase(this.repository);

  Future<Map<String, dynamic>> execute() async {
    return await repository.getFeedData();
  }
}
