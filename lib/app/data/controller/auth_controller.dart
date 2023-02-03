import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rf_majid/app/routes/app_pages.dart';

import '../../modules/cart/controllers/cart_controller.dart';

class AuthController extends GetxController {
  // final cart = Get.find<CartController>();

  final googleSignIn = GoogleSignIn();
  UserCredential? _userCredential;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //
  late TextEditingController searchFriendsController,
      namaPaketcontroller,
      mejacontroller;
  //
  void onInit() {
    super.onInit();
    namaPaketcontroller = TextEditingController();
    mejacontroller = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    namaPaketcontroller.dispose();
    mejacontroller.dispose();
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print('Welcome ${googleUser!.email}');

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) => _userCredential = value);

    //user store
    CollectionReference users = firestore.collection('users');
    final cekUser = await users.doc(googleUser.email).get();
    // try {
    //   await googleSignIn.signIn();
    //   final user = googleSignIn.currentUser;
    //   if (user!.email == "admin@mail.com") {
    //     // User has admin role
    //   } else {

    //     // User does not have admin role
    //   }
    // } catch (error) {
    //   print(error);
    // }
    if (!cekUser.exists) {
      users.doc(googleUser.email).set({
        'uid': _userCredential!.user!.uid,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'photo': googleUser.photoUrl,
        'poin_belanja': 0,
        'createdAt': _userCredential!.user!.metadata.creationTime.toString(),
        'lastLoginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
        // 'list_cari' : [R, RE, REZ, REZA]
      }).then((value) async {
        String temp = '';

        try {
          for (var i = 0; 1 < googleUser.displayName!.length; i++) {
            temp = temp + googleUser.displayName![i];
            await users.doc(googleUser.email).set({
              'list_cari': FieldValue.arrayUnion([temp.toUpperCase()])
            }, SetOptions(merge: true));
          }
        } catch (e) {
          print(e);
        }
      });
    }
    // else {
    // users.doc(googleUser.email).update({
    // 'lastLoginAt':
    // _userCredential!.user!.metadata.lastSignInTime.toString(),
    // });
    // }
    Get.offAllNamed(Routes.PREVENT_HOME);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  Future getuid() async {
    Stream<DocumentSnapshot<Map<String, dynamic>>> StreamUsers(String email) {
      return firestore.collection('users').doc(email).snapshots();
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> StreamUsers(String email) {
    return FirebaseFirestore.instance
        .collection('usesrs')
        .doc(email)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUsers() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.email)
        .snapshots();
  }
}
