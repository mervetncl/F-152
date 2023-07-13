import 'package:cloud_firestore/cloud_firestore.dart';

class Otopark {
  final String ad;
  final String fotoUrl;
  final int kapasite;
  final String latitude;
  final String longitude;
  final String saticiId;
  final String ucret;

  Otopark({
    required this.ad,
    required this.fotoUrl,
    required this.kapasite,
    required this.latitude,
    required this.longitude,
    required this.saticiId,
    required this.ucret,
  });

  Map<String, dynamic> toJson() => {
        'ad': ad,
        'fotoUrl': fotoUrl,
        'kapasite': kapasite,
        'latitude': latitude,
        'longitude': longitude,
        'saticiId': saticiId,
        'ucret': ucret,
      };


  factory Otopark.fromSnapshot(QueryDocumentSnapshot<Map<String , dynamic>> data){
    return Otopark(
        ad: data["ad"],
        fotoUrl: data["fotoUrl"],
        kapasite: data["kapasite"],
        latitude: data["latitude"],
        longitude: data["longitude"],
        saticiId: data["saticiId"],
        ucret: data["ucret"]
    );
  }

  static Otopark fromJson(Map<String, dynamic> json) => Otopark(
      ad: json["ad"],
      fotoUrl: json["fotoUrl"],
      kapasite: json["kapasite"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      saticiId: json["saticiId"],
      ucret: json["ucret"]
  );
}
