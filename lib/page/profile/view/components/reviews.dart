import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_reting_app/page/profile/logic/profile_cubit.dart';
import 'package:test_reting_app/page/profile/view/widgets/review_dialog.dart';

import '../../logic/profile_states.dart';
import '../widgets/review_line_item.dart';

class ReviewsFilter extends StatelessWidget {
  const ReviewsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final ProfileCubit cubit = context.read<ProfileCubit>();
        return Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Отзывы',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xff393939),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 48,
                    child: CupertinoButton(
                      color: const Color(0xff0E9D16).withOpacity(0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/pencil.svg'),
                          const SizedBox(width: 10),
                          const Text(
                            'Оставить отзыв',
                            style: TextStyle(
                              color: Color(0xff0E9D15),
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              wordSpacing: 0.24,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                            barrierDismissible: true,
                            context: context,
                            builder: (_) {
                              return ReviewDialog(
                                cubit: cubit,
                              );
                            }).then((value) {
                          if (value is RaviewEditItem) {
                            cubit.udateUserData(value: value);
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 21),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Сортировка:',
                        style: TextStyle(
                          color: Color(0xff808080),
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          wordSpacing: 0.24,
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Text(
                              cubit.data.sortByDateDown
                                  ? 'Самые недавние'
                                  : 'Самые давние',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                wordSpacing: 0.24,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              !cubit.data.sortByDateDown
                                  ? Icons.keyboard_arrow_up_sharp
                                  : Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        onPressed: () {
                          cubit.data.sortByDateDown =
                              !cubit.data.sortByDateDown;
                          cubit.sortReviews();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        );
      },
    );
  }
}
