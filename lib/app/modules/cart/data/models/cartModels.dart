// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.id,
    required this.inklud,
    required this.nama_paket,
    required this.meja,
    required this.pemesan,
    required this.isCekhed,
    required this.namamenu,
  });

  String id;
  String inklud;
  String nama_paket;
  String meja;
  String pemesan;
  bool isCekhed;
  String namamenu;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        inklud: json["inklud"],
        nama_paket: json["nama_paket"],
        meja: json["meja"],
        pemesan: json["pemesan"],
        isCekhed: json["isCekhed"],
        namamenu: json["namamenu"],
      );

  Map<String, dynamic> toJson() => {
        "id": inklud,
        "inklud": inklud,
        "nama_paket": nama_paket,
        "meja": meja,
        "pemesan": pemesan,
        "isCekhed": isCekhed,
        "namamenu": namamenu,
      };
}
