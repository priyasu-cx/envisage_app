import 'package:shared_preferences/shared_preferences.dart';

class CartController {
  late SharedPreferences preferences;

  CartController() {
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  }
}
