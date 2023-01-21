import 'package:flutter/material.dart';

import '../../data/models/user.dart';

class UserName extends StatelessWidget {
  final User user;
  const UserName({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Text(
      user.name!,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Color(0xff393939),
      ),
    );
  }
}
