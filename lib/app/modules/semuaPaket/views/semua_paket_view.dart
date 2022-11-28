import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icony/icony_ikonate.dart';

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
          padding: const EdgeInsets.only(top: 18.0, left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(image: AssetImage('assets/gambar/logo_2.png')),
              Text('Packages',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              const Ikonate(
                Ikonate.cart,
                color: Colors.white,
              ),
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
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              title: "Welcome to Flutter Dev'S",
                              middleText:
                                  "FlutterDevs is a protruding flutter app development company with "
                                  "an extensive in-house team of 30+ seasoned professionals who know "
                                  "exactly what you need to strengthen your business across various dimensions",
                              backgroundColor: Colors.teal,
                              titleStyle: TextStyle(color: Colors.white),
                              middleTextStyle: TextStyle(color: Colors.white),
                              radius: 30);
                        },
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket D",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
                child: Container(
                  padding: EdgeInsets.only(top: 9),
                  height: 200,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Paket A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "lorem ipsum",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "lorem ipsum1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 65,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(21, 255, 255, 255),
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Rp. 100.000, -",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
