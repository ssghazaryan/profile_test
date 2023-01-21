import 'package:dio/dio.dart';

class ProfileRepo {
  Future<Response> getReviews() async {
    return await Dio().get('https://jsonplaceholder.typicode.com/comments');
  }
}
