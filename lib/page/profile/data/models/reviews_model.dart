import 'dart:math';

class ReviewsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;
  DateTime? dateTime;
  int? rate;

  ReviewsModel({
    this.rate,
    this.dateTime,
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
    Random rnd = Random();

    if (json['rate'] == null) {
      rate = rnd.nextInt(4) + 1;
    } else {
      rate = json['rate'];
    }
    if (json['date'] == null) {
      int range = rnd.nextInt(365);
      DateTime randomDate = DateTime.now().subtract(
        Duration(
          days: rnd.nextInt(range),
        ),
      );
      dateTime = randomDate;
    } else {
      dateTime = DateTime.fromMillisecondsSinceEpoch(json['date']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    data['rate'] = rate;
    data['date'] = dateTime!.millisecondsSinceEpoch;

    return data;
  }
}
