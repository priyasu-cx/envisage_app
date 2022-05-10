import 'dart:convert';

import 'package:envisage_app/model/events_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController {
  Future<void> addToCart(EventDetails event) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var cart = _prefs.getStringList("cart") ?? [];

    cart.add(jsonEncode(event).toString());
    print(cart);

    _prefs.setStringList("cart", cart);
  }

  Future<bool> checkInCart(EventDetails event) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var cart = _prefs.getStringList("cart") ?? [];
    return cart.contains(event.toJson().toString());
  }

  // Future<List<dynamic>> getCart() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();

  //   var cart = _prefs.getStringList("cart") ?? [];
  //   List<Map<String, dynamic>> cartValue =
  //       // cart.forEach((index) => jsonDecode(cart[index]));
  //       // print(cartValue);

  //   return cartValue;
  // }
}
