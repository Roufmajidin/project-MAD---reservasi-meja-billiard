import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final Int harga;
  final String inklud;
  final String meja;
  final String nama_paket;
  final String pemesan;
  final Int quantity;
  final String waktu;
  final String namamenu;

  const Product(
      {required this.harga,
      required this.inklud,
      required this.meja,
      required this.nama_paket,
      required this.pemesan,
      required this.quantity,
      required this.namamenu,
      required this.waktu});

  //
  Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        harga: snap['harga'],
        inklud: snap['inklud'],
        meja: snap['meja'],
        nama_paket: snap['nama_paket'],
        pemesan: snap['pemesan'],
        quantity: snap['quantity'],
        namamenu: snap['namamenu'],
        waktu: snap['waktu']);
    return product;
  }
}
