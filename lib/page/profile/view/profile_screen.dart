import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_reting_app/page/profile/view/components/app_bar.dart';
import 'package:test_reting_app/page/profile/view/widgets/review_line_item.dart';
import 'package:test_reting_app/page/profile/view/widgets/user_name.dart';

import '../logic/profile_cubit.dart';
import '../logic/profile_states.dart';
import 'components/characterics.dart';
import 'components/profile_img.dart';
import 'components/reviews.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    this.outsideTabs = false,
  }) : super(key: key);
  final bool outsideTabs;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (_) => ProfileCubit()..getReviews(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final ProfileCubit cubit = context.read<ProfileCubit>();

          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xff1D69DA),
                  Color(0xff6E3ED3),
                ],
              )),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                      'assets/svg/shine.svg',
                      semanticsLabel: 'Acme Logo',
                    ),
                  ),
                  SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        const CustomAppBar(),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 60,
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                              ),
                              const ProfileImg(),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 130,
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                child: CustomScrollView(
                                  slivers: [
                                    SliverList(
                                      delegate: SliverChildListDelegate(
                                        [
                                          UserName(
                                            user: cubit.data.user,
                                          ),
                                          const SizedBox(height: 20),
                                          const Characteritics(),
                                          Container(
                                            height: 8,
                                            color: const Color(0xffF2F2F2),
                                          ),
                                          const ReviewsFilter(),
                                        ],
                                      ),
                                    ),
                                    SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        childCount:
                                            cubit.data.user.reviews.length,
                                        (BuildContext context, int index) {
                                          return ReviewLineItem(
                                              item: cubit
                                                  .data.user.reviews[index]);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
