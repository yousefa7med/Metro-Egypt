import 'package:flutter/material.dart';
import 'package:metro_egy/views/Widgets/station_viewer.dart';

class RouteViewer extends StatelessWidget {
  const RouteViewer({
    super.key,
    required this.routes,
    required this.directions,
  });
  final List<List<String>> routes;
  final List<String> directions;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: routes.length,

      itemBuilder: (context, index) {
        return Column(
          children: [
  
            Row(
              children: [
      
                Text('Direction To :', style: TextStyle(fontSize: 24)),
                Text(
                  directions[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xff9D2235),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: (53 * routes[index].length).toDouble(),
              child: StationViewer(route: routes[index]),
            ),
          ],
        );
      },
    );
  }
}
