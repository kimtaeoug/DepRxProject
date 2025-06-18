import 'package:objectbox/objectbox.dart';

@Entity()
class FCMBox {
  int id;
  String? fcmData;

  FCMBox({this.id = 0, required this.fcmData});
}
