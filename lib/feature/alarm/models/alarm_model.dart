import 'package:hive/hive.dart';
part 'alarm_model.g.dart';

@HiveType(typeId: 1)
class AlarmModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  int hours;
  @HiveField(2)
  int color;
  @HiveField(3)
  String data;

  AlarmModel(
      {required this.title,
        required this.hours,
        required this.color,
        required this.data,
      });
}
