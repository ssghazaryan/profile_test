import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svg/back_icon.svg',
          ),
        ),
        const Expanded(
          child: Text(
            'Рейтинг профиля',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 0.41,
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svg/share_icon.svg',
          ),
        ),
      ],
    );
  }
}
