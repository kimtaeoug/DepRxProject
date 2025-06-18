import 'package:objectbox/objectbox.dart';

@Entity()
class SchedulerBox {
  int id;
  String? data;

  SchedulerBox({this.id = 0, this.data});
}
