import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/colors/colors.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: AppColors.red,
    );
  }
}
