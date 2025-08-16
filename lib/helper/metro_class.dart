import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:metro_egy/models/detailsModel.dart';
import 'package:metro_egy/models/station_model.dart';

class Metro {
  Details details = Details();

  final List<String> allStation = [
    "Helwan",
    "Ain Helwan",
    "Helwan University",
    "Wadi Hof",
    "Hadayek Helwan",
    "El-Maasara",
    "Tora El-Asmant",
    "Kozzika",
    "Tora El-Balad",
    "Sakanat El Maadi",
    "El Maadi",
    "Hadayek El Maadi",
    "Dar El Salam",
    "El Zahraa",
    "Mar Girgis",
    "El Malek El Saleh",
    "El Sayeda Zeinab",
    "Saad Zaghloul",
    "Sadat",
    "Nasser",
    "Orabi",
    "El Shohadaa",
    "Ghamra",
    "El Demerdash",
    "Manshiet El Sadr",
    "Kobri El Qobba",
    "Hammamat El Qobba",
    "Saray El Qobba",
    "Hadayek El Zaitoun",
    "Helmeyet El Zeitoun",
    "El Matariya",
    "Ain Shams",
    "Ezbet El Nakhl",
    "Al Marg",
    "New El-Marg",
    "Shubra El Kheima",
    "Koliet El Zeraa",
    "Mezallat",
    "Khalafawy",
    "St. Teresa",
    "Rod El Farag",
    "Masarra",
    "El Shohadaa",
    "Attaba",
    "Naguib",
    "Sadat",
    "Opera",
    "Dokki",
    "El Bohoth",
    "Cairo University",
    "Faisal",
    "Giza",
    "Omm El Misryeen",
    "Sakiat Mekky",
    "El-Mounib",
    "Adly Mansour",
    "El Haykestep",
    "Omar Ibn El Khattab",
    "Qobaa",
    "Hesham Barakat",
    "El Nozha",
    "Nadi El Shams",
    "Alf Maskan",
    "Heliopolis",
    "Haroun",
    "Al Ahram",
    "Kolleyet El Banat",
    "Stadium",
    "Fair Zone",
    "Abbassiya",
    "Abdou Pasha",
    "El Geish",
    "Bab El Shaaria",
    "Attaba",
    "Nasser",
    "Maspero",
    "Safaa Hegazy",
    "Kit Kat",
    "Tawfikia",
    "Wadi El Nile",
    "Gamat El Dowal",
    "Boulak El Dakrour",
    "Cairo University",
    "Sudan",
    "Imbaba",
    "El-Bohy",
    "El-Qawmia",
    "Ring Road",
    "Rod al-Farag Corridor",
  ];

  final line1 = [
    "Helwan",
    "Ain Helwan",
    "Helwan University",
    "Wadi Hof",
    "Hadayek Helwan",
    "El-Maasara",
    "Tora El-Asmant",
    "Kozzika",
    "Tora El-Balad",
    "Sakanat El Maadi",
    "El Maadi",
    "Hadayek El Maadi",
    "Dar El Salam",
    "El Zahraa",
    "Mar Girgis",
    "El Malek El Saleh",
    "El Sayeda Zeinab",
    "Saad Zaghloul",
    "Sadat",
    "Nasser",
    "Orabi",
    "El Shohadaa",
    "Ghamra",
    "El Demerdash",
    "Manshiet El Sadr",
    "Kobri El Qobba",
    "Hammamat El Qobba",
    "Saray El Qobba",
    "Hadayek El Zaitoun",
    "Helmeyet El Zeitoun",
    "El Matariya",
    "Ain Shams",
    "Ezbet El Nakhl",
    "Al Marg",
    "New El-Marg",
  ];

  final line2 = [
    "Shubra El Kheima",
    "Koliet El Zeraa",
    "Mezallat",
    "Khalafawy",
    "St. Teresa",
    "Rod El Farag",
    "Masarra",
    "El Shohadaa",
    "Attaba",
    "Naguib",
    "Sadat",
    "Opera",
    "Dokki",
    "El Bohoth",
    "Cairo University",
    "Faisal",
    "Giza",
    "Omm El Misryeen",
    "Sakiat Mekky",
    "El-Mounib",
  ];

  List<String> line3 = [
    "Adly Mansour",
    "El Haykestep",
    "Omar Ibn El Khattab",
    "Qobaa",
    "Hesham Barakat",
    "El Nozha",
    "Nadi El Shams",
    "Alf Maskan",
    "Heliopolis",
    "Haroun",
    "Al Ahram",
    "Kolleyet El Banat",
    "Stadium",
    "Fair Zone",
    "Abbassiya",
    "Abdou Pasha",
    "El Geish",
    "Bab El Shaaria",
    "Attaba",
    "Nasser",
    "Maspero",
    "Safaa Hegazy",
    "Kit Kat",
    "Tawfikia",
    "Wadi El Nile",
    "Gamat El Dowal",
    "Boulak El Dakrour",
    "Cairo University",
  ];

  final Sudan_rodAlFarag = [
    "Sudan",
    "Imbaba",
    "El-Bohy",
    "El-Qawmia",
    "Ring Road",
    "Rod al-Farag Corridor",
  ];

  final commonStations = [
    'Nasser',
    'Attaba',
    'El Shohadaa',
    'Sadat',
    "Cairo University",
  ];

  late List<List<String>> allLines = [line1, line2, line3];

  Either<String, Details> getRoute(String startStation, String finalStation) {
    if (startStation == finalStation) {
      return Left("Please check Your Destination");
    }
    print('$startStation , $finalStation ================================');
    if ((line3.sublist(line3.indexOf("Tawfikia")).contains(startStation) &&
            Sudan_rodAlFarag.contains(finalStation)) ||
        (line3.sublist(line3.indexOf("Tawfikia")).contains(finalStation) &&
            Sudan_rodAlFarag.contains(startStation))) {
      line3TranstionHandling(startStation, finalStation, allLines);
      return Right(details);
    }
    if (Sudan_rodAlFarag.contains(startStation) ||
        Sudan_rodAlFarag.contains(finalStation)) {
      line3 = line3.sublist(0, line3.indexOf("Kit Kat") + 1) + Sudan_rodAlFarag;
      allLines[2] = line3;
      commonStations.remove("Cairo University");
    }

    List<String> sameLine = findSameLine(startStation, finalStation);

    if (sameLine.isNotEmpty) {
      directRoute(startStation, finalStation, sameLine);
      return Right(details);
    } else {
      final message = getMultiLineRoute(startStation, finalStation);

      return message == null ? Right(details) : Left(message);
    }
  }

  void line3TranstionHandling(
    String startStation,
    String finalStation,
    List<List<String>> allLines,
  ) {
    final List<String> line4 = [
      "Rod al-Farag Corridor",
      "Ring Road",
      "El-Qawmia",
      "El-Bohy",
      "Imbaba",
      "Sudan",
      "Kit Kat",
      "Tawfikia",
      "Wadi El Nile",
      "Gamat El Dowal",
      "Boulak El Dakrour",
      "Cairo University",
    ];
    allLines.clear();
    allLines.add(line4);
    List<String> route1 = getLineRoute(line4, startStation, 'Kit Kat');
    List<String> route2 = getLineRoute(line4, 'Kit Kat', finalStation);

    String direction2 = getDirection(line4, "Kit Kat", finalStation);
    List<String> route = route1 + route2;
    details.routes!.add(route1);
    details.routes!.add(route2);
    details.directions!.add("Adly Mansour");
    details.directions!.add(direction2);
    details.ticketPrice.value = ticketCost(route.length);
    details.time.value = timeOfTravel(route.length);
    details.stationCount.value = route.length;
  }

  List<String> findSameLine(String start, String end) {
    for (var line in allLines) {
      if (line.contains(start) && line.contains(end)) {
        return line;
      }
    }
    return [];
  }

  void directRoute(String start, String end, List<String> line) {
    final route = getLineRoute(line, start, end);
    final direction = getDirection(line, start, end);
    details.routes!.add(route);
    details.directions!.add(direction);
    details.ticketPrice.value = ticketCost(route.length);
    details.time.value = timeOfTravel(route.length);
    details.stationCount.value = route.length;
  }

  String? getMultiLineRoute(String startStation, String finalStation) {
    List<String> bestRoute = [];
    List<String> bestpart1 = [];
    List<String> bestpart2 = [];
    String direction1 = '', direction2 = '';
    List<String> part1 = [], part2 = [];

    for (var transfer in commonStations) {
      List<String> lineToTransfer = [], lineFromTransfer = [];

      for (var line in allLines) {
        if (line.contains(startStation) && line.contains(transfer)) {
          lineToTransfer = line;
        }
        if (line.contains(transfer) && line.contains(finalStation)) {
          lineFromTransfer = line;
        }
      }

      if (lineToTransfer.isNotEmpty && lineFromTransfer.isNotEmpty) {
        part1 = getLineRoute(lineToTransfer, startStation, transfer);
        part2 = getLineRoute(lineFromTransfer, transfer, finalStation);
        direction1 = getDirection(lineToTransfer, startStation, transfer);
        direction2 = getDirection(lineFromTransfer, transfer, finalStation);

        final fullRoute = part1 + part2.sublist(1);

        if (bestRoute.isEmpty || fullRoute.length < bestRoute.length) {
          bestpart1 = part1;
          bestpart2 = part2;
          bestRoute = fullRoute;
        }
      }
    }

    if (bestRoute.isNotEmpty) {
      details.routes!.add(bestpart1);
      details.routes!.add(bestpart2);
      details.directions!.add(direction1);
      details.directions!.add(direction2);
      details.ticketPrice.value = ticketCost(bestRoute.length);
      details.time.value = timeOfTravel(bestRoute.length);
      details.stationCount.value = bestRoute.length;
      return null;
    } else {
      return "Please check Your Destination";
    }
  }

  List<String> getLineRoute(List<String> line, String start, String end) {
    final int indexS = line.indexOf(start);
    final int indexF = line.indexOf(end);
    List<String> route = [];
    if ((indexF - indexS) > 0) {
      for (var i = indexS; i <= indexF; i++) {
        route.add(line[i]);
      }
    } else {
      for (var i = indexS; i >= indexF; i--) {
        route.add(line[i]);
      }
    }
    return route;
  }

  String getDirection(List<String> line, String start, String end) {
    int indexS = line.indexOf(start);
    int indexF = line.indexOf(end);

    if ((indexF - indexS) > 0) {
      return line[line.length - 1];
    } else {
      return line[0];
    }
  }

  int ticketCost(int numOfStation) {
    int ticketPrice = 0;
    if (numOfStation <= 9) {
      ticketPrice = 8;
    } else if (numOfStation <= 16) {
      ticketPrice = 10;
    } else if (numOfStation <= 23) {
      ticketPrice = 15;
    } else {
      ticketPrice = 20;
    }
    return ticketPrice;
  }

  int timeOfTravel(int numOfStation) => numOfStation * 2;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.Ge
      // Get.snackbar('Error', )
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Permission Required',
        'Location permission is permanently denied. Please enable it from settings.',
      );

      // فتح إعدادات التطبيق
      await Geolocator.openAppSettings();

      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  String getNearestStation(double latitude, double longitude) {
    var lowestDistance = 999999999999999.0;
    double distance;
    StationModel? station;
    for (var elemnet in allLinesDetails) {
      distance = Geolocator.distanceBetween(
        latitude,
        longitude,
        elemnet.latitude!,
        elemnet.longitudee!,
      );
      if (lowestDistance > distance) {
        lowestDistance = distance;
        station = elemnet;
      }
    }
    return station!.name!;
  }
}

List<StationModel> allLinesDetails = [
  StationModel(name: "Helwan", latitude: 29.8490, longitudee: 31.3342),
  StationModel(name: "Ain Helwan", latitude: 29.8628, longitudee: 31.3250),
  StationModel(
    name: "Helwan University",
    latitude: 29.8689,
    longitudee: 31.3203,
  ),
  StationModel(name: "Wadi Hof", latitude: 29.8794, longitudee: 31.3133),
  StationModel(name: "Hadayek Helwan", latitude: 29.8972, longitudee: 31.3042),
  StationModel(name: "El-Maasara", latitude: 29.9061, longitudee: 31.2997),
  StationModel(name: "Tora El-Asmant", latitude: 29.9258, longitudee: 31.2878),
  StationModel(name: "Kozzika", latitude: 29.9361, longitudee: 31.2817),
  StationModel(name: "Tora El-Balad", latitude: 29.9464, longitudee: 31.2736),
  StationModel(
    name: "Sakanat El-Maadi",
    latitude: 29.9528,
    longitudee: 31.2633,
  ),
  StationModel(name: "Maadi", latitude: 29.9597, longitudee: 31.2581),
  StationModel(
    name: "Hadayek El-Maadi",
    latitude: 29.9700,
    longitudee: 31.2506,
  ),
  StationModel(name: "Dar El-Salam", latitude: 29.9819, longitudee: 31.2422),
  StationModel(name: "El-Zahraa'", latitude: 29.9953, longitudee: 31.2317),
  StationModel(name: "Mar Girgis", latitude: 30.0058, longitudee: 31.2294),
  StationModel(
    name: "El-Malek El-Saleh",
    latitude: 30.0169,
    longitudee: 31.2310,
  ),
  StationModel(
    name: "Al-Sayeda Zeinab",
    latitude: 30.0292,
    longitudee: 31.2353,
  ),
  StationModel(name: "Saad Zaghloul", latitude: 30.0367, longitudee: 31.2381),
  StationModel(name: "Sadat", latitude: 30.0444, longitudee: 31.2356),
  StationModel(name: "Nasser", latitude: 30.0536, longitudee: 31.2389),
  StationModel(name: "Orabi", latitude: 30.0575, longitudee: 31.2425),
  StationModel(name: "Al-Shohadaa", latitude: 30.0620, longitudee: 31.2461),
  StationModel(name: "Ghamra", latitude: 30.0689, longitudee: 31.2647),
  StationModel(name: "El-Demerdash", latitude: 30.0772, longitudee: 31.2778),
  StationModel(
    name: "Manshiet El-Sadr",
    latitude: 30.0822,
    longitudee: 31.2878,
  ),
  StationModel(name: "Kobri El-Qobba", latitude: 30.0870, longitudee: 31.2939),
  StationModel(
    name: "Hammamat El-Qobba",
    latitude: 30.0903,
    longitudee: 31.2981,
  ),
  StationModel(name: "Saray El-Qobba", latitude: 30.0981, longitudee: 31.3047),
  StationModel(
    name: "Hadayeq El-Zaitoun",
    latitude: 30.1053,
    longitudee: 31.3100,
  ),
  StationModel(
    name: "Helmeyet El-Zaitoun",
    latitude: 30.1144,
    longitudee: 31.3139,
  ),
  StationModel(name: "El-Matareyya", latitude: 30.1214, longitudee: 31.3139),
  StationModel(name: "Ain Shams", latitude: 30.1311, longitudee: 31.3181),
  StationModel(name: "Ezbet El-Nakhl", latitude: 30.1392, longitudee: 31.3244),
  StationModel(name: "El-Marg", latitude: 30.1522, longitudee: 31.3356),
  StationModel(name: "New El-Marg", latitude: 30.1633, longitudee: 31.3383),
  StationModel(
    name: "Shubra El Kheima",
    latitude: 30.1225,
    longitudee: 31.2447,
  ),
  StationModel(
    name: "Koleyet El Zeraa",
    latitude: 30.1139,
    longitudee: 31.2486,
  ),
  StationModel(name: "Mezallat", latitude: 30.1050, longitudee: 31.2467),
  StationModel(name: "Khalafawy", latitude: 30.0981, longitudee: 31.2453),
  StationModel(name: "St. Teresa", latitude: 30.0883, longitudee: 31.2456),
  StationModel(name: "Rod El Farag", latitude: 30.0806, longitudee: 31.2456),
  StationModel(name: "Masarra", latitude: 30.0711, longitudee: 31.2450),
  StationModel(name: "El Shohadaa", latitude: 30.0619, longitudee: 31.2461),
  StationModel(name: "Attaba", latitude: 30.0525, longitudee: 31.2469),
  StationModel(name: "Naguib", latitude: 30.0453, longitudee: 31.2442),
  StationModel(name: "Sadat", latitude: 30.0444, longitudee: 31.2356),
  StationModel(name: "Opera", latitude: 30.0420, longitudee: 31.2253),
  StationModel(name: "Dokki", latitude: 30.0383, longitudee: 31.2119),
  StationModel(name: "El Bohoth", latitude: 30.0358, longitudee: 31.2003),
  StationModel(
    name: "Cairo University",
    latitude: 30.0272,
    longitudee: 31.2011,
  ),
  StationModel(name: "Faisal", latitude: 30.0172, longitudee: 31.2039),
  StationModel(name: "Giza", latitude: 30.0106, longitudee: 31.2070),
  StationModel(name: "Omm El Misryeen", latitude: 30.0053, longitudee: 31.2081),
  StationModel(name: "Sakiat Mekky", latitude: 29.9956, longitudee: 31.2086),
  StationModel(name: "El-Mounib", latitude: 29.9814, longitudee: 31.2120),
  StationModel(name: "Adly Mansour", latitude: 30.1469, longitudee: 31.4214),
  StationModel(name: "El Haykestep", latitude: 30.1439, longitudee: 31.4047),
  StationModel(
    name: "Omar Ibn El-Khattab",
    latitude: 30.1406,
    longitudee: 31.3930,
  ),
  StationModel(name: "Qobaa", latitude: 30.1347, longitudee: 31.3839),
  StationModel(name: "Hesham Barakat", latitude: 30.1311, longitudee: 31.3728),
  StationModel(name: "El Nozha", latitude: 30.1283, longitudee: 31.3600),
  StationModel(name: "Nadi El-Shams", latitude: 30.1222, longitudee: 31.3439),
  StationModel(name: "Alf Maskan", latitude: 30.1170, longitudee: 31.3397),
  StationModel(
    name: "Heliopolis Square",
    latitude: 30.1081,
    longitudee: 31.3381,
  ),
  StationModel(name: "Haroun", latitude: 30.1000, longitudee: 31.3328),
  StationModel(name: "Al-Ahram", latitude: 30.0914, longitudee: 31.3264),
  StationModel(
    name: "Koleyet El-Banat",
    latitude: 30.0836,
    longitudee: 31.3290,
  ),
  StationModel(name: "Stadium", latitude: 30.0731, longitudee: 31.3175),
  StationModel(name: "Fair Zone", latitude: 30.0733, longitudee: 31.3011),
  StationModel(name: "Abbassia", latitude: 30.0697, longitudee: 31.2808),
  StationModel(name: "Abdou Pasha", latitude: 30.0647, longitudee: 31.2747),
  StationModel(name: "El Geish", latitude: 30.0628, longitudee: 31.2669),
  StationModel(name: "Bab El Shaaria", latitude: 30.0539, longitudee: 31.2561),
  StationModel(name: "Attaba", latitude: 30.0525, longitudee: 31.2469),
  StationModel(name: "Nasser", latitude: 30.0536, longitudee: 31.2389),
  StationModel(name: "Maspero", latitude: 30.0556, longitudee: 31.2322),
  StationModel(name: "Safaa Hegazy", latitude: 30.0625, longitudee: 31.2225),
  StationModel(name: "Kit Kat", latitude: 30.0667, longitudee: 31.2131),
  StationModel(name: "Sudan", latitude: 30.0697, longitudee: 31.2053),
  StationModel(name: "Imbaba", latitude: 30.0750, longitudee: 31.2075),
  StationModel(name: "El-Bohy", latitude: 30.0822, longitudee: 31.2106),
  StationModel(name: "El-Qawmia", latitude: 30.0933, longitudee: 31.2089),
  StationModel(name: "Ring Road", latitude: 30.0964, longitudee: 31.1997),
  StationModel(
    name: "Rod al-Farag Corridor",
    latitude: 30.1019,
    longitudee: 31.1831,
  ),
  StationModel(name: "Tawfikia", latitude: 30.0653, longitudee: 31.2025),
  StationModel(name: "Wadi El Nile", latitude: 30.0583, longitudee: 31.2000),
  StationModel(name: "Gamat El Dowal", latitude: 30.0508, longitudee: 31.1997),
  StationModel(
    name: "Boulak El Dakrour",
    latitude: 30.0361,
    longitudee: 31.1964,
  ),
  StationModel(
    name: "Cairo University",
    latitude: 30.0261,
    longitudee: 31.2011,
  ),
];

List<StationModel> line1 = [
  StationModel(name: "Helwan", latitude: 29.8490, longitudee: 31.3342),
  StationModel(name: "Ain Helwan", latitude: 29.8628, longitudee: 31.3250),
  StationModel(
    name: "Helwan University",
    latitude: 29.8689,
    longitudee: 31.3203,
  ),
  StationModel(name: "Wadi Hof", latitude: 29.8794, longitudee: 31.3133),
  StationModel(name: "Hadayek Helwan", latitude: 29.8972, longitudee: 31.3042),
  StationModel(name: "El-Maasara", latitude: 29.9061, longitudee: 31.2997),
  StationModel(name: "Tora El-Asmant", latitude: 29.9258, longitudee: 31.2878),
  StationModel(name: "Kozzika", latitude: 29.9361, longitudee: 31.2817),
  StationModel(name: "Tora El-Balad", latitude: 29.9464, longitudee: 31.2736),
  StationModel(
    name: "Sakanat El-Maadi",
    latitude: 29.9528,
    longitudee: 31.2633,
  ),
  StationModel(name: "Maadi", latitude: 29.9597, longitudee: 31.2581),
  StationModel(
    name: "Hadayek El-Maadi",
    latitude: 29.9700,
    longitudee: 31.2506,
  ),
  StationModel(name: "Dar El-Salam", latitude: 29.9819, longitudee: 31.2422),
  StationModel(name: "El-Zahraa'", latitude: 29.9953, longitudee: 31.2317),
  StationModel(name: "Mar Girgis", latitude: 30.0058, longitudee: 31.2294),
  StationModel(
    name: "El-Malek El-Saleh",
    latitude: 30.0169,
    longitudee: 31.2310,
  ),
  StationModel(
    name: "Al-Sayeda Zeinab",
    latitude: 30.0292,
    longitudee: 31.2353,
  ),
  StationModel(name: "Saad Zaghloul", latitude: 30.0367, longitudee: 31.2381),
  StationModel(name: "Sadat", latitude: 30.0444, longitudee: 31.2356),
  StationModel(name: "Nasser", latitude: 30.0536, longitudee: 31.2389),
  StationModel(name: "Orabi", latitude: 30.0575, longitudee: 31.2425),
  StationModel(name: "Al-Shohadaa", latitude: 30.0620, longitudee: 31.2461),
  StationModel(name: "Ghamra", latitude: 30.0689, longitudee: 31.2647),
  StationModel(name: "El-Demerdash", latitude: 30.0772, longitudee: 31.2778),
  StationModel(
    name: "Manshiet El-Sadr",
    latitude: 30.0822,
    longitudee: 31.2878,
  ),
  StationModel(name: "Kobri El-Qobba", latitude: 30.0870, longitudee: 31.2939),
  StationModel(
    name: "Hammamat El-Qobba",
    latitude: 30.0903,
    longitudee: 31.2981,
  ),
  StationModel(name: "Saray El-Qobba", latitude: 30.0981, longitudee: 31.3047),
  StationModel(
    name: "Hadayeq El-Zaitoun",
    latitude: 30.1053,
    longitudee: 31.3100,
  ),
  StationModel(
    name: "Helmeyet El-Zaitoun",
    latitude: 30.1144,
    longitudee: 31.3139,
  ),
  StationModel(name: "El-Matareyya", latitude: 30.1214, longitudee: 31.3139),
  StationModel(name: "Ain Shams", latitude: 30.1311, longitudee: 31.3181),
  StationModel(name: "Ezbet El-Nakhl", latitude: 30.1392, longitudee: 31.3244),
  StationModel(name: "El-Marg", latitude: 30.1522, longitudee: 31.3356),
  StationModel(name: "New El-Marg", latitude: 30.1633, longitudee: 31.3383),
];

List<StationModel> line2 = [
  StationModel(
    name: "Shubra El Kheima",
    latitude: 30.1225,
    longitudee: 31.2447,
  ),
  StationModel(
    name: "Koleyet El Zeraa",
    latitude: 30.1139,
    longitudee: 31.2486,
  ),
  StationModel(name: "Mezallat", latitude: 30.1050, longitudee: 31.2467),
  StationModel(name: "Khalafawy", latitude: 30.0981, longitudee: 31.2453),
  StationModel(name: "St. Teresa", latitude: 30.0883, longitudee: 31.2456),
  StationModel(name: "Rod El Farag", latitude: 30.0806, longitudee: 31.2456),
  StationModel(name: "Masarra", latitude: 30.0711, longitudee: 31.2450),
  StationModel(name: "El Shohadaa", latitude: 30.0619, longitudee: 31.2461),
  StationModel(name: "Attaba", latitude: 30.0525, longitudee: 31.2469),
  StationModel(name: "Naguib", latitude: 30.0453, longitudee: 31.2442),
  StationModel(name: "Sadat", latitude: 30.0444, longitudee: 31.2356),
  StationModel(name: "Opera", latitude: 30.0420, longitudee: 31.2253),
  StationModel(name: "Dokki", latitude: 30.0383, longitudee: 31.2119),
  StationModel(name: "El Bohoth", latitude: 30.0358, longitudee: 31.2003),
  StationModel(
    name: "Cairo University",
    latitude: 30.0272,
    longitudee: 31.2011,
  ),
  StationModel(name: "Faisal", latitude: 30.0172, longitudee: 31.2039),
  StationModel(name: "Giza", latitude: 30.0106, longitudee: 31.2070),
  StationModel(name: "Omm El Misryeen", latitude: 30.0053, longitudee: 31.2081),
  StationModel(name: "Sakiat Mekky", latitude: 29.9956, longitudee: 31.2086),
  StationModel(name: "El-Mounib", latitude: 29.9814, longitudee: 31.2120),
];
List<StationModel> line3 = [
  StationModel(name: "Adly Mansour", latitude: 30.1469, longitudee: 31.4214),
  StationModel(name: "El Haykestep", latitude: 30.1439, longitudee: 31.4047),
  StationModel(
    name: "Omar Ibn El-Khattab",
    latitude: 30.1406,
    longitudee: 31.3930,
  ),
  StationModel(name: "Qobaa", latitude: 30.1347, longitudee: 31.3839),
  StationModel(name: "Hesham Barakat", latitude: 30.1311, longitudee: 31.3728),
  StationModel(name: "El Nozha", latitude: 30.1283, longitudee: 31.3600),
  StationModel(name: "Nadi El-Shams", latitude: 30.1222, longitudee: 31.3439),
  StationModel(name: "Alf Maskan", latitude: 30.1170, longitudee: 31.3397),
  StationModel(
    name: "Heliopolis Square",
    latitude: 30.1081,
    longitudee: 31.3381,
  ),
  StationModel(name: "Haroun", latitude: 30.1000, longitudee: 31.3328),
  StationModel(name: "Al-Ahram", latitude: 30.0914, longitudee: 31.3264),
  StationModel(
    name: "Koleyet El-Banat",
    latitude: 30.0836,
    longitudee: 31.3290,
  ),
  StationModel(name: "Stadium", latitude: 30.0731, longitudee: 31.3175),
  StationModel(name: "Fair Zone", latitude: 30.0733, longitudee: 31.3011),
  StationModel(name: "Abbassia", latitude: 30.0697, longitudee: 31.2808),
  StationModel(name: "Abdou Pasha", latitude: 30.0647, longitudee: 31.2747),
  StationModel(name: "El Geish", latitude: 30.0628, longitudee: 31.2669),
  StationModel(name: "Bab El Shaaria", latitude: 30.0539, longitudee: 31.2561),
  StationModel(name: "Attaba", latitude: 30.0525, longitudee: 31.2469),
  StationModel(name: "Nasser", latitude: 30.0536, longitudee: 31.2389),
  StationModel(name: "Maspero", latitude: 30.0556, longitudee: 31.2322),
  StationModel(name: "Safaa Hegazy", latitude: 30.0625, longitudee: 31.2225),
  StationModel(name: "Kit Kat", latitude: 30.0667, longitudee: 31.2131),
  StationModel(name: "Sudan", latitude: 30.0697, longitudee: 31.2053),
  StationModel(name: "Imbaba", latitude: 30.0750, longitudee: 31.2075),
  StationModel(name: "El-Bohy", latitude: 30.0822, longitudee: 31.2106),
  StationModel(name: "El-Qawmia", latitude: 30.0933, longitudee: 31.2089),
  StationModel(name: "Ring Road", latitude: 30.0964, longitudee: 31.1997),
  StationModel(
    name: "Rod al-Farag Corridor",
    latitude: 30.1019,
    longitudee: 31.1831,
  ),
  StationModel(name: "Tawfikia", latitude: 30.0653, longitudee: 31.2025),
  StationModel(name: "Wadi El Nile", latitude: 30.0583, longitudee: 31.2000),
  StationModel(name: "Gamat El Dowal", latitude: 30.0508, longitudee: 31.1997),
  StationModel(
    name: "Boulak El Dakrour",
    latitude: 30.0361,
    longitudee: 31.1964,
  ),
  StationModel(
    name: "Cairo University",
    latitude: 30.0261,
    longitudee: 31.2011,
  ),
];

// void main() {
//   String startStation = takeInput(allLines, 'Enter your start station');
//   String finalStation = takeInput(allLines, 'Enter your end station');

//   if (startStation == finalStation) {
//     print("You Are Already in $startStation");
//     return;
//   }
//   if ((line3.sublist(line3.indexOf("Tawfikia")).contains(startStation) &&
//           Sudan_rodAlFarag.contains(finalStation)) ||
//       (line3.sublist(line3.indexOf("Tawfikia")).contains(finalStation) &&
//           Sudan_rodAlFarag.contains(startStation))) {
//     line3TranstionHandling(startStation, finalStation, allLines);
//     return;
//   }
//   if (Sudan_rodAlFarag.contains(startStation) ||
//       Sudan_rodAlFarag.contains(finalStation)) {
//     line3 = line3.sublist(0, line3.indexOf("Kit Kat") + 1) + Sudan_rodAlFarag;
//     allLines[2] = line3;
//     commonStations.remove("Cairo University");
//   }

//   List<String> sameLine = findSameLine(startStation, finalStation);

//   if (sameLine.isNotEmpty) {
//     print(
//       "<===========================================================================>",
//     );

//     printDirectRoute(startStation, finalStation, sameLine);
//     int numOfStation = getNumOfStation(startStation, finalStation, sameLine);
//     printTicketCost(numOfStation);
//     printtimeOfTravel(timeOfTravel(numOfStation));
//   } else {
//     getMultiLineRoute(startStation, finalStation);
//   }
// }

// void line3TranstionHandling(
//   String startStation,
//   String finalStation,
//   List<List<String>> allLines,
// ) {
//   final List<String> line4 = [
//     "Rod al-Farag Corridor",
//     "Ring Road",
//     "El-Qawmia",
//     "El-Bohy",
//     "Imbaba",
//     "Sudan",
//     "Kit Kat",
//     "Tawfikia",
//     "Wadi El Nile",
//     "Gamat El Dowal",
//     "Boulak El Dakrour",
//     "Cairo University",
//   ];
//   allLines.clear();
//   allLines.add(line4);
//   List<String> route1 = getLineRoute(line4, startStation, 'Kit Kat');
//   List<String> route2 = getLineRoute(line4, 'Kit Kat', finalStation);

//   String direction2 = getDirection(line4, "Kit Kat", finalStation);
//   List<String> route = route1 + route2;

//   printRoute(route1, "Adly Mansour");
//   printRoute(route2, direction2);
//   print("Total Stations: ${route.length}");
//   printTicketCost(route.length);
//   printtimeOfTravel(timeOfTravel(route.length));
// }

// List<String> findSameLine(String start, String end) {
//   for (var line in allLines) {
//     if (line.contains(start) && line.contains(end)) {
//       return line;
//     }
//   }
//   return [];
// }

// void printDirectRoute(String start, String end, List<String> line) {
//   final route = getLineRoute(line, start, end);
//   final direction = getDirection(line, start, end);

//   printRoute(route, direction);
// }

// void getMultiLineRoute(String startStation, String finalStation) {
//   List<String> bestRoute = [];
//   List<String> bestpart1 = [];
//   List<String> bestpart2 = [];
//   String direction1 = '', direction2 = '';
//   List<String> part1 = [], part2 = [];

//   for (var transfer in commonStations) {
//     List<String> lineToTransfer = [], lineFromTransfer = [];

//     for (var line in allLines) {
//       if (line.contains(startStation) && line.contains(transfer)) {
//         lineToTransfer = line;
//       }
//       if (line.contains(transfer) && line.contains(finalStation)) {
//         lineFromTransfer = line;
//       }
//     }

//     if (lineToTransfer.isNotEmpty && lineFromTransfer.isNotEmpty) {
//       part1 = getLineRoute(lineToTransfer, startStation, transfer);
//       part2 = getLineRoute(lineFromTransfer, transfer, finalStation);
//       direction1 = getDirection(lineToTransfer, startStation, transfer);
//       direction2 = getDirection(lineFromTransfer, transfer, finalStation);

//       final fullRoute = part1 + part2.sublist(1);

//       if (bestRoute.isEmpty || fullRoute.length < bestRoute.length) {
//         bestpart1 = part1;
//         bestpart2 = part2;
//         bestRoute = fullRoute;
//       }
//     }
//   }

//   if (bestRoute.isNotEmpty) {
//     print(
//       "<===========================================================================>",
//     );

//     printRoute(bestpart1, direction1);
//     printRoute(bestpart2, direction2);
//     print("Full Route: $bestRoute");
//     print("Total Stations: ${bestRoute.length}");
//     printTicketCost(bestRoute.length);
//     printtimeOfTravel(timeOfTravel(bestRoute.length));
//     print(
//       "<===========================================================================>",
//     );
//   } else {
//     print("No valid route found between $startStation and $finalStation.");
//   }
// }

// List<String> getLineRoute(List<String> line, String start, String end) {
//   final int indexS = line.indexOf(start);
//   final int indexF = line.indexOf(end);
//   List<String> route = [];
//   if ((indexF - indexS) > 0) {
//     for (var i = indexS; i <= indexF; i++) {
//       route.add(line[i]);
//     }
//   } else {
//     for (var i = indexS; i >= indexF; i--) {
//       route.add(line[i]);
//     }
//   }
//   return route;
// }

// String getDirection(List<String> line, String start, String end) {
//   int indexS = line.indexOf(start);
//   int indexF = line.indexOf(end);

//   if ((indexF - indexS) > 0) {
//     return line[line.length - 1];
//   } else {
//     return line[0];
//   }
// }

// void printRoute(List<String> route, String direction) {
//   // print("<===========================>");
//   print("Your direction: $direction");
//   print("Stations count: ${route.length}");
//   print("Route: $route");
//   print(
//     "<===========================================================================>",
//   );
// }

// void printTicketCost(int numOfStation) {
//   int ticketPrice = 0;
//   if (numOfStation <= 9) {
//     ticketPrice = 8;
//   } else if (numOfStation <= 16) {
//     ticketPrice = 10;
//   } else if (numOfStation <= 23) {
//     ticketPrice = 15;
//   } else {
//     ticketPrice = 20;
//   }
//   print("Ticket Price : $ticketPrice");
// }

// int getNumOfStation(start, end, line) {
//   int indexS = line.indexOf(start);
//   int indexF = line.indexOf(end);

//   if ((indexF - indexS) > 0) {
//     return (indexF - indexS);
//   } else {
//     return -(indexF - indexS);
//   }
// }

// int timeOfTravel(int numOfStation) => numOfStation * 2;

// void printtimeOfTravel(int time) => print("Time Of Travel : $time ");

// String takeInput(List<List<String>> allLines, String message) {
//   allLines.add(Sudan_rodAlFarag);
//   String station = '';

//   while (true) {
//     print(message);
//     station = stdin.readLineSync()!;

//     for (var line in allLines) {
//       if (line.contains(station)) {
//         allLines.removeAt(3);
//         return station;
//       }
//     }
//     print("Invalid Station\n");
//   }
// }
