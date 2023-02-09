import 'package:cloud_firestore/cloud_firestore.dart';

class Minuman {
  final int harga;
  final String namamenu;
  // final String imageUrl;

  const Minuman({required this.harga, required this.namamenu});

  //
  static Minuman fromSnapshot(DocumentSnapshot snap) {
    Minuman product = Minuman(namamenu: snap['namamenu'], harga: snap['harga']);
    return product;
  }
}
