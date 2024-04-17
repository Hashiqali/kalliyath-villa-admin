import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VillaDetails extends StatefulWidget {
  const VillaDetails({super.key, required this.details});

  final Map<String, dynamic> details;

  @override
  State<VillaDetails> createState() => _VillaDetailsState();
}

class _VillaDetailsState extends State<VillaDetails> {
  List carouselimages = [];
  @override
  void initState() {
    carouselimages = widget.details['images'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Villa Details',
          style: TextStyle(
              color: Colors.black, fontFamily: "Kalliyath", fontSize: 20),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 45,right: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.details['name'],
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Kalliyath",
                            fontSize: 30),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          widget.details['status']==false ?"Active":"Blocked",
                          style: TextStyle(
                              color: widget.details['status'] == false
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : Colors.red,
                              fontFamily: "Kalliyath",
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        width: size.width / 5,
                        height: size.height / 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        width: size.width / 5,
                        height: size.height / 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        width: size.width / 5,
                        height: size.height / 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        width: size.width / 5,
                        height: size.height / 4,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        // Padding(
        //   padding: const EdgeInsets.all(40),
        //   child: Text(
        //     widget.details['name'],
        //     style: const TextStyle(
        //         color: Colors.black, fontFamily: "Kalliyath", fontSize: 30),
        //   ),
        // ),
        // Container(
        //   width: size.width / 3,
        //   height: size.height / 3,
        //   child: CarouselSlider(
        //     options: CarouselOptions(
        //       height: 400,
        //       aspectRatio: 2,
        //       viewportFraction: .9,
        //       initialPage: 0,
        //       enableInfiniteScroll: true,
        //       reverse: false,
        //       autoPlay: true,
        //       autoPlayInterval: const Duration(seconds: 3),
        //       autoPlayAnimationDuration: const Duration(milliseconds: 800),
        //       autoPlayCurve: Curves.fastOutSlowIn,
        //       enlargeCenterPage: true,
        //       enlargeFactor: 0.3,
        //       scrollDirection: Axis.horizontal,
        //     ),
        //     items: carouselimages.map((i) {
        //       return Builder(
        //         builder: (BuildContext context) {
        //           return Container(
        //             width: size.width / 3.5,
        //             height: size.height / 3,
        //             margin: const EdgeInsets.symmetric(horizontal: 5.0),
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: Colors.amber,
        //                 image: DecorationImage(
        //                     filterQuality: FilterQuality.high,
        //                     fit: BoxFit.cover,
        //                     image: NetworkImage(i))),
        //           );
        //         },
        //       );
        //     }).toList(),
        //   ),
        // )
        //   ],
        // ),
      ),
    );
  }
}
