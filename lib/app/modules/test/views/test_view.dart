import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test_controller.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TestView extends GetView<TestController> {
  const TestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(''),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  height: 100,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Selamat Hari Perempuan Internasioal',
                          style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                        ),
                        Text(
                          '08 Maret 2023',
                          style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    // height: 200,
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "https://cdn.popmama.com/content-images/post/20220301/hari-perempuan-nasionaljpg-f4384eca06327dc7841d579d3ac4249b.jpg",
                    // height: 150.0,
                    // width: 100.0,
                  ),
                )),
                Container(
                  height: 100,
                  child: Center(
                      child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Panjangkan Umurnya dan semoga Baik-baik saja',
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    totalRepeatCount: 10,
                    pause: const Duration(milliseconds: 100),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
