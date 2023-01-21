import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/profile_cubit.dart';
import '../../logic/profile_states.dart';

class Characteritics extends StatelessWidget {
  final bool createReview;
  final List<int> selectedCharacteristics;
  final Function({
    required int id,
  })? onSelect;

  const Characteritics({
    super.key,
    this.createReview = false,
    this.selectedCharacteristics = const [],
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final ProfileCubit cubit = context.read<ProfileCubit>();
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (int i = 0;
                        i <
                            (cubit.data.showAllCharacteristic || createReview
                                ? cubit.data.mockCharacteristics.length
                                : 5);
                        i++)
                      Builder(builder: (context) {
                        final item = cubit.data.mockCharacteristics[i];

                        bool checked = createReview &&
                            selectedCharacteristics.contains(item.id);
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                            color: checked
                                ? const Color(0xff0E9E19)
                                : const Color(0xffF0F0F0),
                          ),
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: onSelect == null
                                ? null
                                : () {
                                    onSelect!(id: item.id);
                                  },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: item.emoji,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'EmojiOne',
                                        ),
                                      ),
                                      TextSpan(
                                        text: item.title,
                                        style: TextStyle(
                                          letterSpacing: 0.24,
                                          fontSize: 16,
                                          color: checked
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      if (!createReview)
                                        TextSpan(
                                          text:
                                              ' ${cubit.data.user.characteristics![item.id] ?? ''}',
                                          style: TextStyle(
                                            letterSpacing: 0.24,
                                            fontSize: 16,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  ],
                ),
              ),
            ),
            if (!createReview)
              Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xffD3D3D3)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cubit.data.showAllCharacteristic
                                    ? 'Скрыть'
                                    : 'Показать ещё ${cubit.data.mockCharacteristics.length - 5}',
                                style: const TextStyle(
                                  letterSpacing: 0.24,
                                  fontSize: 16,
                                  color: Color(0xffD3D3D3),
                                ),
                              ),
                              Icon(
                                !cubit.data.showAllCharacteristic
                                    ? Icons.keyboard_arrow_down_outlined
                                    : Icons.keyboard_arrow_up_outlined,
                                color: const Color(0xffD3D3D3),
                              )
                            ]),
                      ),
                      onPressed: () {
                        cubit.data.showAllCharacteristic =
                            !cubit.data.showAllCharacteristic;
                        cubit.update();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              )
          ],
        );
      },
    );
  }
}
