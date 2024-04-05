import 'package:flutter/material.dart';

class VillasPage extends StatelessWidget {
  const VillasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: size.height,
        width: size.width,
      ),
    );
  }
}
