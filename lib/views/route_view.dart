import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_egy/models/detailsModel.dart';
import 'package:metro_egy/views/Widgets/route_viewer.dart';

class RouteView extends StatelessWidget {
  const RouteView({super.key});

  @override
  Widget build(BuildContext context) {
    Details details = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Route',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff9D2235),
      ),
      body: RouteViewer(
        routes: details.routes!,
        directions: details.directions!,
      ),
    );
  }
}
