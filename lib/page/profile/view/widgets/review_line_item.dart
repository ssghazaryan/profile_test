import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_reting_app/page/profile/data/models/reviews_model.dart';

const List selectedItems = [1, 11];

class ReviewLineItem extends StatelessWidget {
  final ReviewsModel item;
  const ReviewLineItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = selectedItems.contains(item.id);
    Color hederColor = selected ? Colors.white : const Color(0xff909090);
    Color textColor = selected ? Colors.white : Colors.black;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: selected
                  ? const LinearGradient(colors: [
                      Color(0xff0D9C13),
                      Color(0xff11B97C),
                    ], transform: GradientRotation(270))
                  : null,
              color: selected ? null : const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 15,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: item.email!
                                .substring(
                                  0,
                                  item.email!.indexOf('@'),
                                )
                                .replaceAll('_', ' '),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: hederColor,
                            ),
                          ),
                          TextSpan(
                            text: ' ${item.rate} ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: selected
                                  ? Colors.white
                                  : const Color(0xff28A32E),
                            ),
                          ),
                        ]),
                      ),
                      Icon(
                        Icons.star_rounded,
                        color:
                            selected ? Colors.white : const Color(0xff28A32E),
                        size: 15,
                      ),
                      const Spacer(),
                      Text(
                        DateFormat('dd.MM.yyyy').format(item.dateTime!),
                        style: TextStyle(
                          fontSize: 15,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.body!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (selected)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 7),
              child: SvgPicture.asset('assets/svg/ving_right.svg'),
            ),
          ),
        if (selected)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: SvgPicture.asset('assets/svg/ving_left.svg'),
            ),
          ),
      ],
    );
  }
}
