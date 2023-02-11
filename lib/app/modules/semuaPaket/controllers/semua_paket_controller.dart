import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SemuaPaketController extends GetxController {
  //TODO: Implement SemuaPaketController

  final count = 0.obs;

  //

  RxDouble tot = 0.0.obs;
  // var isi = ''.obs;
  var tabI = 0;
  bool cKo = true;
  var tabUkuran = 0;
  var ubah = false;
  var ubahDetail = ''.obs;
  var tabIndex = 0.obs;
  var menuA = [].obs;
  var menuB = [].obs;
  var htMenu = [].obs;
  var warna = 0.obs;
  DateTime dateTimeNow = DateTime.now();
  DateTime? dateTime;

  // waktu
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay? timeUp;

//
  // render paket selected di cart
  // add inklud di admin page

  var counti = 0.obs;
  var countil = 2.obs;
  var valuess = [].obs;
  var ink = [].obs;
  var tanda = 0.obs;
  // gambar

  String gm = '';
//
  var paket = '';
  var meja = '';
  RxList inklud = [].obs;
  var hargaP = 0;
  var inkl = [].obs;

  // end
  var point = 0.obs;
  var poinPlus = 2;

  var selected = [].obs;
  var selected2 = [].obs;
  var selectedPR = [].obs;
  var selectedPaket = [].obs;
  var menu = [];
  var hargaMinuman = 0.0;
  var hargaPaket = 0.0;
  int totminuman = 0;
  String selectedPesanan = '';
  // final List items = ['Item1', 'Item2', 1];
  DateTime? selectedDate;
  String? _selectedTime;

  //
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  clearListInklud() {
    // var array = value;
    List d = [];
    // d.add(value);
    ink = [].obs;
    update();
    print(ink);
  }

  void base() {
    menuB = [].obs;
    // selectedPaket.clear();
    update();

    selected.clear();
    // update();
    print('list paket : ${menuB}');

    update();
  }

  refreshR() {
    menuA.clear();
    menuB.clear();
    htMenu.clear();
    hargaMinuman = 0.0;
    update();
    print(
        'selectedminuman dari nol is : ${menuA}, hargaMinuman:${hargaMinuman}, clear ${htMenu}, clear ${menuA}');
  }

  final Stream<QuerySnapshot> cart = FirebaseFirestore.instance
      .collection('pesananUser')
      .where('pemesan', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('isselesai', isEqualTo: false)
      .snapshots();

  void increment() => count.value++;
}
