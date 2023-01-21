import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_reting_app/page/profile/view/components/profile_img.dart';
import 'package:test_reting_app/page/profile/view/widgets/user_name.dart';

import '../../logic/profile_cubit.dart';
import '../../logic/profile_states.dart';
import '../components/characterics.dart';

class RaviewEditItem {
  final double rate;
  final List selectedCharacteristics;
  final String comment;

  RaviewEditItem({
    required this.rate,
    required this.selectedCharacteristics,
    required this.comment,
  });
}

class ReviewDialog extends StatefulWidget {
  final ProfileCubit cubit;
  const ReviewDialog({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  double rate = 9;
  List<int> selectedCharacteristics = [];
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>.value(
      value: widget.cubit,
      child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final ProfileCubit cubit = context.read<ProfileCubit>();
            return Material(
              color: Colors.transparent,
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  margin: EdgeInsets.only(
                    top: 10 + AppBar().preferredSize.height,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: CupertinoButton(
                                    child: const Text(
                                      'Отмена',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                              const Expanded(
                                child: Text(
                                  'Оставить отзыв',
                                  style: TextStyle(
                                    letterSpacing: 0.41,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(width: 100),
                            ],
                          ),
                          const ProfileImg(),
                          Center(
                            child: UserName(
                              user: cubit.data.user,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.only(
                                top: 30,
                                bottom: 170,
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Оцените ваше общение',
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                              text: rate.toStringAsFixed(0),
                                              style: const TextStyle(
                                                fontFamily: 'WorkSans-Regular',
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff109E1B),
                                              ),
                                            ),
                                            const TextSpan(
                                              text: '/10',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffB3B3B3),
                                              ),
                                            ),
                                          ]))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Slider(
                                  activeColor: const Color(0xff1DFF00),
                                  inactiveColor: const Color(0xffC4C4C4),
                                  min: 0.0,
                                  max: 10.0,
                                  value: rate,
                                  divisions: 10,
                                  onChanged: (value) {
                                    setState(() {
                                      rate = value;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffF0F0F0),
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    maxLines: 4,
                                    controller: controller,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      hintText: 'Напишите отзыв',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    'Короткая характеристика',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        40,
                                      ),
                                      color: const Color(0xffF4E7FE),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          Icons.add_circle_outlined,
                                          color: Color(0xff910AFB),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'Добавить свою характеристику',
                                          style: TextStyle(
                                            letterSpacing: 0.24,
                                            fontSize: 16,
                                            color: Color(0xff910AFB),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Characteritics(
                                  createReview: true,
                                  selectedCharacteristics:
                                      selectedCharacteristics,
                                  onSelect: ({required id}) {
                                    if (selectedCharacteristics.contains(id)) {
                                      selectedCharacteristics.remove(id);
                                    } else {
                                      selectedCharacteristics.add(id);
                                    }
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.white,
                                    Color.fromRGBO(255, 255, 255, 0)
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.white,
                              height: 140,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff910AFB),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: const Center(
                                        child: Text(
                                          'Опубликовать',
                                          style: TextStyle(
                                            letterSpacing: 0.24,
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                        RaviewEditItem(
                                          comment: controller.text.trim(),
                                          rate: rate,
                                          selectedCharacteristics:
                                              selectedCharacteristics,
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                        text:
                                            'Нажимая "Опубликовать", вы подтверждаете\n',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            'согласие с условиями использования Uny',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff299BFF),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
