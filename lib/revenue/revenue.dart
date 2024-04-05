import 'package:flutter/material.dart';

class RevenuePage extends StatelessWidget {
  const RevenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.blue,
        height: size.height,
        width: size.width,
      ),
    );
  }
}
