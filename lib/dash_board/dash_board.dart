
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.amber,
        height: size.height,
        width: size.width,
      ),
    );
  }
}
