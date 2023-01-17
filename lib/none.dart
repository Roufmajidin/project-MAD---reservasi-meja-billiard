//     StreamBuilder(
//                             stream: FirebaseFirestore.instance
//                                 .collection('pesanan')
//                                 .where('pemesan',
//                                     isEqualTo:
//                                         FirebaseAuth.instance.currentUser!.uid)
//                                 .snapshots(),
//                             builder: (__,
//                                 AsyncSnapshot<
//                                         QuerySnapshot<Map<String, dynamic>>>
//                                     snapshot) {
//                               if (snapshot.hasError) {
//                                 return Text(
//                                   "error",
//                                   style: TextStyle(
//                                       fontSize: 100, color: Colors.white),
//                                 );
//                               }
//                               if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return Text("Loading");
//                               }

//                               final data = snapshot.requireData;
//                               return ListView.builder(
//                                   itemCount: data.size,
//                                   scrollDirection: Axis.vertical,
//                                   physics: NeverScrollableScrollPhysics(),
//                                   shrinkWrap: true,
//                                   itemBuilder: (context, index) {
//                                     var value = data.docs[index]['isCekhed'];
//                                     return Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             var cprint = print("ok");
//                                             var dataid = data.docs[index].id;
//                                             cController.upminuman(
//                                                 data, index, dataid);
//                                             cController.kondisiMinuman(
//                                                 data, index, dataid);
//                                             //set to history
//                                             cController.upHistoryMinuman(
//                                                 data, index, dataid);

//                                             print(data.docs[index].id);
//                                           },
//                                           onLongPress: () {
//                                             print("object");
//                                             var dataid = data.docs[index].id;

//                                             cController.minusMinuman(
//                                                 data, index, dataid);
//                                             cController.kondisiMinuman(
//                                                 data, index, dataid);
//                                           },
//                                           child: Container(
//                                             decoration: BoxDecoration(
//                                                 color: const Color.fromARGB(
//                                                         250, 18, 30, 54)
//                                                     .withOpacity(0.5),
//                                                 borderRadius:
//                                                     BorderRadius.circular(4)),
//                                             height: 130,
//                                             width: 500,
//                                             padding: EdgeInsets.symmetric(
//                                                 horizontal: 13, vertical: 12),
//                                             child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       GestureDetector(
//                                                         onTap: () {
//                                                           var cprint =
//                                                               print("ok");
//                                                           var dataid = data
//                                                               .docs[index].id;
//                                                           cController.upminuman(
//                                                               data,
//                                                               index,
//                                                               dataid);
//                                                           cController
//                                                               .kondisiMinuman(
//                                                                   data,
//                                                                   index,
//                                                                   dataid);
//                                                           print(data
//                                                               .docs[index].id);
//                                                         },
//                                                         onLongPress: () {
//                                                           print("object");
//                                                           var dataid = data
//                                                               .docs[index].id;

//                                                           cController
//                                                               .minusMinuman(
//                                                                   data,
//                                                                   index,
//                                                                   dataid);
//                                                           cController
//                                                               .kondisiMinuman(
//                                                                   data,
//                                                                   index,
//                                                                   dataid);
//                                                         },
//                                                         child: CustomCheckBox(
//                                                             value: value,
//                                                             shouldShowBorder:
//                                                                 true,
//                                                             uncheckedFillColor:
//                                                                 Colors
//                                                                     .transparent,
//                                                             uncheckedIconColor:
//                                                                 Colors
//                                                                     .transparent,
//                                                             borderColor:
//                                                                 Color.fromARGB(
//                                                                     249,
//                                                                     180,
//                                                                     180,
//                                                                     180),
//                                                             checkedFillColor:
//                                                                 const Color
//                                                                         .fromARGB(
//                                                                     250,
//                                                                     18,
//                                                                     30,
//                                                                     54),
//                                                             borderRadius: 4,
//                                                             borderWidth: 1,
//                                                             checkBoxSize: 18,
//                                                             splashColor:
//                                                                 Colors.amber,
//                                                             onChanged:
//                                                                 (value) {}),
//                                                       ),
//                                                       Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Text(
//                                                             "${data.docs[index]['namamenu']}",
//                                                             style: const TextStyle(
//                                                                 color: Colors
//                                                                     .white,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                                 fontSize: 16),
//                                                           ),
//                                                           SizedBox(
//                                                               height:
//                                                                   Get.height *
//                                                                       0.01),
//                                                           Container(
//                                                             // padding: EdgeInsets.only(left: 10),
//                                                             child: Text(
//                                                               "Table : ${data.docs[index]['namamenu']}",
//                                                               style: TextStyle(
//                                                                   color: Color
//                                                                       .fromARGB(
//                                                                           255,
//                                                                           201,
//                                                                           201,
//                                                                           201),
//                                                                   fontSize: 15),
//                                                             ),
//                                                           ),
//                                                           Container(
//                                                             // padding: EdgeInsets.only(left: 10),
//                                                             child: Text(
//                                                               "Rp ${data.docs[index]['harga']}",
//                                                               style: TextStyle(
//                                                                   color: Color
//                                                                       .fromARGB(
//                                                                           255,
//                                                                           201,
//                                                                           201,
//                                                                           201),
//                                                                   fontSize: 15),
//                                                             ),
//                                                           ),
//                                                           Container(
//                                                             // padding: EdgeInsets.only(left: 10),
//                                                             child: Text(
//                                                               "Rp ${data.docs[index]['dataminuman']}",
//                                                               style: TextStyle(
//                                                                   color: Color
//                                                                       .fromARGB(
//                                                                           255,
//                                                                           201,
//                                                                           201,
//                                                                           201),
//                                                                   fontSize: 15),
//                                                             ),
//                                                           )
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Column(
//                                                     children: [
//                                                       (data.docs[index]
//                                                                   [
//                                                                   'onhistory'] ==
//                                                               true)
//                                                           ? Text(
//                                                               "on History : ${data.docs[index]['onhistory']}",
//                                                               style: TextStyle(
//                                                                   color: Color
//                                                                       .fromARGB(
//                                                                           255,
//                                                                           201,
//                                                                           201,
//                                                                           201),
//                                                                   fontSize: 15),
//                                                             )
//                                                           : Text(
//                                                               "on History : ${data.docs[index]['onhistory']}",
//                                                               style: TextStyle(
//                                                                   color: Color
//                                                                       .fromARGB(
//                                                                           255,
//                                                                           226,
//                                                                           21,
//                                                                           21),
//                                                                   fontSize:
//                                                                       15)),
//                                                       SizedBox(
//                                                         height: 4,
//                                                       ),
//                                                       Text(
//                                                         "Qty : ${data.docs[index]['quantity']}",
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Color.fromARGB(
//                                                                     255,
//                                                                     201,
//                                                                     201,
//                                                                     201),
//                                                             fontSize: 15),
//                                                       ),
//                                                       SizedBox(
//                                                         height: 6,
//                                                       ),
//                                                       Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 top: 12),
//                                                         child: Row(
//                                                           children: [],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                     .symmetric(
//                                                                 vertical: 6.0),
//                                                         child: GFIconButton(
//                                                           onPressed: () async {
//                                                             // deletePes(
//                                                             //     data.docs[index].id);
//                                                           },
//                                                           size: GFSize.SMALL,
//                                                           icon: const Iconify(
//                                                             Bi.trash,
//                                                             color: Colors.white,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   )
//                                                 ]),
//                                           ),
//                                         ),
//                                         SizedBox(height: 9),
//                                       ],
//                                     );
//                                   });
//                             }),


// return Card(
//     elevation: 5,
//     child: Padding(
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             dataminuman['namaminuman'],
//             style: TextStyle(fontSize: 20),
//           ),
//           Text(
//             '${dataminuman['harga']}',
//             style: TextStyle(fontSize: 20),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               InkWell(
//                 onTap: () {},
//                 child: Text(
//                   'Respond',
//                   style: TextStyle(color: Colors.white, fontSize: 12),
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: Text(
//                   'Read',
//                   style: TextStyle(color: Colors.white, fontSize: 12),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
