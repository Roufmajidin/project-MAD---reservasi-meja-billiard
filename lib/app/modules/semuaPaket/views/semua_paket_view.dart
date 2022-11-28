import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/semua_paket_controller.dart';

class SemuaPaketView extends GetView<SemuaPaketController> {
  const SemuaPaketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf19191E),
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(image: AssetImage('assets/gambar/logo_2.png')),
              Text('Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              Icon(
                Icons.card_travel_rounded,
                color: Colors.white,
              )
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: [
              Card(
                color: Colors.teal,
              ),
              Card(
                color: Colors.cyan,
              ),
              Card(
                color: Colors.yellowAccent,
              ),
              Card(
                color: Colors.red,
              ),
              Card(
                color: Colors.red,
              ),
              Card(
                color: Colors.yellow,
              ),
              Card(
                color: Colors.purpleAccent,
              ),
              Card(
                color: Colors.indigo,
              ),
              Card(
                color: Colors.black,
              ),
              Card(
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
