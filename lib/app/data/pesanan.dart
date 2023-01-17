class Pesanan {
  String? inklud;
  String? paket;
  DateTime? created;

  Pesanan();

  Map<String, dynamic> toJson() =>
      {'inklud': inklud, 'paket': paket, 'created': created};

  Pesanan.fromSnapshot(snapshot)
      : inklud = snapshot.data()['inklud'],
        paket = snapshot.data()['paket'],
        created = snapshot.data()['created'].toDate();
}
