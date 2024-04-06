import 'package:flutter/material.dart';
import 'package:kalliyath_villa_admin/villas/table/table_datas.dart';
import 'package:kalliyath_villa_admin/villas/table/table_headings.dart';


class VillasPage extends StatefulWidget {
  const VillasPage({super.key});

  @override
  State<VillasPage> createState() => _VillasPageState();
}

class _VillasPageState extends State<VillasPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [TableItems(size: size), TableDatas(size: size)],
          ),
        ),
      ),
    );
  }
}
