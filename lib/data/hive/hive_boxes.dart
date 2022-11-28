import 'package:hive/hive.dart';

import '../models/user_model.dart';

class Boxes {
  static Box<UserModel> getUser() => Hive.box("user");
}
