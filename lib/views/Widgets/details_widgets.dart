import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_egy/models/detailsModel.dart';

import 'package:metro_egy/views/route_view.dart';

class DetailsWidget extends StatelessWidget {
  DetailsWidget({super.key, required this.details});
  Rxn<Details> details;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 230,
            width: MediaQuery.sizeOf(context).width - 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 223, 219, 219),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Number of Station  : ${details.value!.stationCount.value} Station',
                  style: TextStyle(color: Color(0xff9D2235), fontSize: 20),
                ),
                Text(
                  'Ticket Price : ${details.value!.ticketPrice.value} EGP',
                  style: TextStyle(color: Color(0xff9D2235), fontSize: 20),
                ),

                Text(
                  'Traveling Time : ${details.value!.time.value} Min',
                  style: TextStyle(color: Color(0xff9D2235), fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(RouteView(), arguments: details.value);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff9D2235),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Show Me Route',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // AppButton(onPressed: () {}, text: 'Show Me Route'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
