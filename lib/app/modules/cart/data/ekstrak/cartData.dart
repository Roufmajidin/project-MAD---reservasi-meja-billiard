import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:rf_majid/app/modules/cart/controllers/cart_controller.dart';
import 'package:rf_majid/app/modules/cart/data/cart.dart';

class cartPaket extends StatelessWidget {
  bool iscekBox2Cheked = false;
  final CartController cController = Get.find();

  @override
  Widget build(BuildContext context) {
    UserCredential? _userCredential;
    var email = GoogleSignIn().signIn();
    return Column(
      children: [
        // test

        //   Container(
        //     color: const Color.fromARGB(250, 18, 30, 54).withOpacity(0.5),
        //     child: Column(
        //       children: [
        //         Column(
        //           children: [
        //             StreamBuilder(
        //                 stream: FirebaseFirestore.instance
        //                     .collection('pesanan')
        //                     .doc(FirebaseAuth.instance.currentUser!.email)
        //                     .collection('reservedUser')
        //                     .doc(FirebaseAuth.instance.currentUser!.email)
        //                     .collection('paket')
        //                     .snapshots(),
        //                 builder: (__,
        //                     AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
        //                         snapshot) {
        //                   if (snapshot.hasError) {
        //                     return Text(
        //                       "error",
        //                       style: TextStyle(
        //                           fontSize: 100, color: Colors.white),
        //                     );
        //                   }
        //                   if (snapshot.connectionState ==
        //                       ConnectionState.waiting) {
        //                     return Text("Loading");
        //                   }

        //                   final data = snapshot.requireData;
        //                   return ListView.builder(
        //                       itemCount: data.size,
        //                       scrollDirection: Axis.vertical,
        //                       physics: NeverScrollableScrollPhysics(),
        //                       shrinkWrap: true,
        //                       itemBuilder: (context, index) {
        //                         return Column(
        //                           crossAxisAlignment:
        //                               CrossAxisAlignment.start,
        //                           children: [
        //                             GestureDetector(
        //                               onTap: () {
        //                                 var cprint = print("ok");
        //                                 var dataid = data.docs[index].id;
        //                                 cController.upminuman(
        //                                     data, index, dataid);

        //                                 cController.kondisiMinuman(
        //                                     data, index, dataid);
        //                                 print(data.docs[index].id);
        //                               },
        //                               onLongPress: () {
        //                                 print("object");
        //                                 var dataid = data.docs[index].id;

        //                                 cController.minusMinuman(
        //                                     data, index, dataid);
        //                                 cController.kondisiMinuman(
        //                                     data, index, dataid);
        //                               },
        //                               child: Container(
        //                                 decoration: BoxDecoration(
        //                                     color: const Color.fromARGB(
        //                                             250, 18, 30, 54)
        //                                         .withOpacity(0.5),
        //                                     borderRadius:
        //                                         BorderRadius.circular(4)),
        //                                 // height: 130,
        //                                 width: 500,
        //                                 padding: EdgeInsets.symmetric(
        //                                     horizontal: 13, vertical: 12),
        //                                 child: Row(
        //                                     mainAxisAlignment:
        //                                         MainAxisAlignment
        //                                             .spaceBetween,
        //                                     children: [
        //                                       Row(
        //                                         children: [
        //                                           Column(
        //                                             crossAxisAlignment:
        //                                                 CrossAxisAlignment
        //                                                     .start,
        //                                             children: [
        //                                               Text(
        //                                                 "${data.docs[index]['namaPaket']}",
        //                                                 style:
        //                                                     const TextStyle(
        //                                                         color: Colors
        //                                                             .white,
        //                                                         fontWeight:
        //                                                             FontWeight
        //                                                                 .bold,
        //                                                         fontSize: 16),
        //                                               ),
        //                                               SizedBox(
        //                                                   height: Get.height *
        //                                                       0.01),
        //                                               Container(
        //                                                 // padding: EdgeInsets.only(left: 10),
        //                                                 child: Text(
        //                                                   "Table ${data.docs[index]['quantity']}",
        //                                                   style: TextStyle(
        //                                                       color: Color
        //                                                           .fromARGB(
        //                                                               255,
        //                                                               201,
        //                                                               201,
        //                                                               201),
        //                                                       fontSize: 15),
        //                                                 ),
        //                                               )
        //                                             ],
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ]),
        //                               ),
        //                             ),
        //                           ],
        //                         );
        //                       });
        //                 }),
        //           ],
        //         ),
        //         Text("Add Ons"),
        //         StreamBuilder(
        //             stream: FirebaseFirestore.instance
        //                 .collection('pesanan')
        //                 .doc(FirebaseAuth.instance.currentUser!.email)
        //                 .collection('reservedUser')
        //                 .doc(FirebaseAuth.instance.currentUser!.email)
        //                 .collection('minuman')
        //                 .snapshots(),
        //             builder: (__,
        //                 AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
        //                     snapshot) {
        //               if (snapshot.hasError) {
        //                 return Text(
        //                   "error",
        //                   style:
        //                       TextStyle(fontSize: 100, color: Colors.white),
        //                 );
        //               }
        //               if (snapshot.connectionState ==
        //                   ConnectionState.waiting) {
        //                 return Text("Loading");
        //               }

        //               final data = snapshot.requireData;
        //               return ListView.builder(
        //                   itemCount: data.size,
        //                   scrollDirection: Axis.vertical,
        //                   physics: NeverScrollableScrollPhysics(),
        //                   shrinkWrap: true,
        //                   itemBuilder: (context, index) {
        //                     return Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         GestureDetector(
        //                           onTap: () {},
        //                           onLongPress: () {},
        //                           child: Container(
        //                             decoration: BoxDecoration(
        //                                 color: const Color.fromARGB(
        //                                         250, 18, 30, 54)
        //                                     .withOpacity(0.5),
        //                                 borderRadius:
        //                                     BorderRadius.circular(4)),
        //                             // height: 130,
        //                             width: 500,
        //                             padding: EdgeInsets.all(12),
        //                             child: Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   Row(
        //                                     crossAxisAlignment:
        //                                         CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text(
        //                                         "${data.docs[index]['namaminuman']}",
        //                                         style: const TextStyle(
        //                                             color: Colors.white,
        //                                             fontWeight:
        //                                                 FontWeight.bold,
        //                                             fontSize: 14),
        //                                       ),
        //                                       SizedBox(
        //                                         width: 18,
        //                                       ),
        //                                       Container(
        //                                         // padding: EdgeInsets.only(left: 10),
        //                                         child: Text(
        //                                           "x ${data.docs[index]['quantity']}",
        //                                           style: TextStyle(
        //                                               color: Color.fromARGB(
        //                                                   255, 201, 201, 201),
        //                                               fontSize: 12),
        //                                         ),
        //                                       )
        //                                     ],
        //                                   ),
        //                                 ]),
        //                           ),
        //                         ),
        //                       ],
        //                     );
        //                   });
        //             }),
        //       ],
        //     ),
        //   ),
      ],
    );
  }
}
