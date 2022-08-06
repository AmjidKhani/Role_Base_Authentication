import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
class controlller with ChangeNotifier
{
  var selectedvalue;
 String get statee=>selectedvalue;

  void onchangegender(var gender)
  {
    selectedvalue=gender;
    notifyListeners();
  }

}