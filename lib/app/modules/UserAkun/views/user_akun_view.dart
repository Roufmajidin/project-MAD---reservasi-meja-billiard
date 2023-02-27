import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:Coruja_billiard/app/modules/cart/controllers/cart_controller.dart';
import 'package:Coruja_billiard/app/modules/cart/views/cart_view.dart';

import '../../../data/controller/auth_controller.dart';
import '../controllers/user_akun_controller.dart';

class UserAkunView extends GetView<UserAkunController> {
  UserAkunView({Key? key}) : super(key: key);
  final cCart = Get.find<CartController>();

  final authC = Get.find<AuthController>();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/gambar/logo_1.png',
                        width: 30, height: 30, fit: BoxFit.fill),
                    // SizedBox(
                    //   width: 80,
                    // ),
                    Text('My Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'poppins',
                            fontSize: 20.0)),

                    SizedBox(
                      width: 80,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 0.3,
                decoration: BoxDecoration(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  profileUser(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // bahasa(),
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
  final authC = Get.find<AuthController>();

  buttonLogout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cCart = Get.find<CartController>();

    return Center(
      child: InkWell(
        onTap: () {
          // cCart.freeOder
          cCart.clearPoin();
          authC.logout();
        },
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 231, 156),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
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

class profileUser extends StatefulWidget {
  profileUser({
    Key? key,
  }) : super(key: key);

  @override
  State<profileUser> createState() => _profileUserState();
}

class _profileUserState extends State<profileUser> {
  final cartc = Get.find<UserAkunController>();
  @override
  void initState() {
    super.initState();
    cartc.convertToNumber;
  }

  final authCon = Get.find<AuthController>();

  final cartC = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      // height: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(249, 24, 33, 50),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 12),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  authCon.auth.currentUser!.photoURL!,
                  height: 45,
                )),
            // width: 100.0,
          ),
          SizedBox(
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authCon.auth.currentUser!.displayName!,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      width: 160,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        authCon.auth.currentUser!.email!,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )

              // poin user

              ,
              Row(
                children: [
                  const Iconify(
                    Bi.coin,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: InkWell(
                      onTap: () {
                        cartC.resetPoin();

                        Get.to(CartView());
                      },
                      child: Text(
                        '${cartC.pointUser.toString()} Poin',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          SizedBox(
            width: 20,
          ),
          //
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

      child: Row(
        children: [
          SizedBox(
            width: 120,
          ),
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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

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
          // padding: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

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

                  ),
            ],
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          // padding: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),

          // height: 25,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(249, 24, 33, 50),
              borderRadius: BorderRadius.circular(8)),
          child: Container(
              // padding: EdgeInsets.only(left: 25),
              child: Center(
            child: Column(
              children: [
                Text(
                  "Tentang Kami",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  "Universitas Catur Insan Cendekia",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 12,
                ),
                Stack(children: [
                  // Text(
                  //   "data",
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rouf Majidin",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            "20200120049",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mochammad Nurul Adzan",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            "20200120054",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Faturohman Kusuma. J",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            " 20200120063",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ])
              ],
            ),
          )

              // width: 100.0,

              ),
        ),
      ],
    );
  }
}
