import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:project_mad/app/modules/home/views/home_view.dart';

import '../controllers/user_akun_controller.dart';

class UserAkunView extends GetView<UserAkunController> {
  const UserAkunView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 4, 4),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 14, right: 14),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/gambar/logo_1.png',
                        width: 30, height: 30, fit: BoxFit.fill),
                    SizedBox(
                      width: 80,
                    ),
                    Text('My Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 2,
                decoration: BoxDecoration(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  profileUser(),
                  SizedBox(
                    height: 20,
                  ),
                  bahasa(),
                  SizedBox(
                    height: 20,
                  ),
                  list(),
                  SizedBox(
                    height: 80,
                  ),
                  buttonLogout()
                ],
              )
            ],
          ),
          // onHistory()
        ])));
  }
}

class buttonLogout extends StatelessWidget {
  const buttonLogout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 231, 156),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: InkWell(
            onTap: () {
              Get.to(Home());
            },
            child: Text(
              "LOG OUT",
              style: TextStyle(
                  color: Color.fromARGB(255, 33, 33, 33),
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

class profileUser extends StatelessWidget {
  const profileUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      // height: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(249, 24, 33, 50),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 12),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/gambar/profile.png',
                  height: 50,
                )),
            // width: 100.0,
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rouf Majid",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "+62 84323901290",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class bahasa extends StatelessWidget {
  const bahasa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // height: 25,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color.fromARGB(249, 24, 33, 50),
          borderRadius: BorderRadius.circular(2)),
      child: Row(
        children: [
          Container(
            // padding: EdgeInsets.only(left: 25),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Text(
                  "Language",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )

                // width: 100.0,
                ),
          ),
          SizedBox(
            width: 120,
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Iconify(
                      Bi.circle_fill,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "EN",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Iconify(
                      Bi.circle,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "ID",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class list extends StatelessWidget {
  const list({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          // height: 25,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(249, 24, 33, 50),
              borderRadius: BorderRadius.circular(2)),
          child: Row(
            children: [
              Container(
                  // padding: EdgeInsets.only(left: 11),
                  child: Text(
                "Setting Akun",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )

                  // width: 100.0,

                  )
            ],
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          padding: EdgeInsets.all(10),
          // height: 25,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(249, 24, 33, 50),
              borderRadius: BorderRadius.circular(2)),
          child: Row(
            children: [
              Container(
                  // padding: EdgeInsets.only(left: 25),
                  child: Text(
                "Change Email",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )

                  // width: 100.0,

                  )
            ],
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          padding: EdgeInsets.all(10),
          // height: 25,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(249, 24, 33, 50),
              borderRadius: BorderRadius.circular(2)),
          child: Row(
            children: [
              Container(
                  // padding: EdgeInsets.only(left: 25),
                  child: Text(
                "Change Phone Number",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )

                  // width: 100.0,

                  )
            ],
          ),
        ),
      ],
    );
  }
}
