import 'package:envisage_app/Cart%20Project/models/product_model.dart';
import 'package:envisage_app/utils/event_model.dart';
import 'package:envisage_app/view/nav_pages/events.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartController extends GetxController {
  // Add a dict to store the products in the cart.
  var _events = {}.obs;
  void clearall(){
    _events={}.obs;
  }
  void addProduct(Events event) {
    if (_events.containsKey(event)) {
      _events[event] += 1;
    } else {
      _events[event] = 1;
    }

    // Get.snackbar(
    //   "Product Added",
    //   "You have added the ${event.name} to the cart",
    //   snackPosition: SnackPosition.BOTTOM,
    //   duration: Duration(seconds: 2),
    // );
    Fluttertoast.showToast(msg: " Added ${event.name} to the cart ");
  }

  void removeProduct(Events event) {

    if (_events.containsKey(event) && _events[event] == 1) {
      _events.removeWhere((key, value) => key == event);
    } else {
      _events[event] -= 1;
    }

  }

  get events => _events;

  // get productSubtotal => _events.entries
  //     .map((product) => product.key.price * product.value)
  //     .toList();

  get total => _events.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);
      //.toStringAsFixed(2);

}
