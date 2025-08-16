import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Details {
  var stationCount=Rxn<int> ();
  var time=Rxn<int> ();
  var ticketPrice=Rxn<int> ();
  List<List<String>>? routes = [];
  List<String>? directions = [];

  void clear() {
    this.directions!.clear();
    this.routes!.clear();
    this.stationCount.value = null;
    this.time.value = null;
    this.ticketPrice.value = null;
  }
}
