import 'package:hive/hive.dart';

part 'park.g.dart';

@HiveType(typeId: 0)
class Park {
  @HiveField(0)
  String? ad;
  @HiveField(1)
  String? fotoUrl;
  @HiveField(2)
  int? kapasite;
  @HiveField(3)
  String? latitude;
  @HiveField(4)
  int? longitude;
  @HiveField(5)
  String? saticiId;
  @HiveField(6)
  String? ucret;
}