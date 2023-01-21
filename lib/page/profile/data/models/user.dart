import 'package:test_reting_app/page/profile/data/models/reviews_model.dart';

class User {
  final int? id;
  final String? name;
  final String? photoUrl;
  double? rating;
  final Map<int, int>? characteristics;
  final List<ReviewsModel> reviews;

  User({
    this.id,
    this.name,
    this.photoUrl,
    this.rating,
    this.characteristics,
    this.reviews = const [],
  });
}
