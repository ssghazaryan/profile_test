import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_reting_app/page/profile/data/models/reviews_model.dart';
import 'package:test_reting_app/page/profile/view/widgets/review_dialog.dart';
import '../data/data/profile_data.dart';
import '../service/profile_repo.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(const ProfileStates());
  ProfileData data = ProfileData();
  ProfileRepo repo = ProfileRepo();

  void update() {
    emit(UpdateState());
    emit(SuccessState());
  }

  Future getReviews() async {
    emit(LoadingState());
    final response = await repo.getReviews();
    if (response.statusCode == 200) {
      data.user.reviews.clear();
      try {
        final items = response.data;
        if (items is List) {
          for (var element in items) {
            if (data.user.reviews.length == 19) break;
            data.user.reviews.add(
              ReviewsModel.fromJson(element),
            );
          }
          sortReviews();
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    emit(SuccessState());
  }

  void sortReviews() {
    data.user.reviews.sort((a, b) {
      if (!data.sortByDateDown) {
        return a.dateTime!.compareTo(b.dateTime!);
      } else {
        return b.dateTime!.compareTo(a.dateTime!);
      }
    });
    update();
  }

  void udateUserData({required RaviewEditItem value}) {
    for (var element in value.selectedCharacteristics) {
      if (data.user.characteristics!.containsKey(element)) {
        int count = data.user.characteristics![element]! + 1;
        data.user.characteristics![element] = count;
      } else {
        data.user.characteristics!.addAll({element: 1});
      }
    }
    data.user.rating = (data.user.rating! + value.rate) / 2;

    if (value.comment != '') {
      data.user.reviews.add(
        ReviewsModel(
            postId: Random().nextInt(999),
            id: Random().nextInt(999),
            body: value.comment,
            dateTime: DateTime.now(),
            email: 'TestUser${Random().nextInt(9)}@mail.ru',
            rate: value.rate ~/ 2),
      );
    }
    sortReviews();
    update();
  }
}
