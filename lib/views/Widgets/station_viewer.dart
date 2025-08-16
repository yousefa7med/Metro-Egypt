import 'dart:ui';

import 'package:flutter/material.dart';

class StationViewer extends StatelessWidget {
  const StationViewer({super.key, required this.route});
  final List<String> route;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),

      itemCount: route.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: Column(
            children: [
              Text(
                route[index],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
