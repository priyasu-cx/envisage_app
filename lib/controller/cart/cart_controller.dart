import 'package:envisage_app/model/events_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController {
  Future<void> addToCart(EventDetails event) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var cart = _prefs.getStringList("cart") ?? [];

    cart.add(event.toJson().toString());
    print(cart);

    _prefs.setStringList("cart", cart);
  }
}
