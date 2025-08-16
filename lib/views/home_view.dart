import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:metro_egy/helper/metro_class.dart';
import 'package:metro_egy/models/detailsModel.dart';
import 'package:metro_egy/models/station_model.dart';
import 'package:metro_egy/views/Widgets/app_button.dart';
import 'package:metro_egy/views/Widgets/app_dropdown_menu.dart';
import 'package:metro_egy/views/Widgets/details_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var details = Rxn<Details>();
  final startStationCont = TextEditingController();
  final textFieldController = TextEditingController();
  final finalStationCont = TextEditingController();
  final startStationList = <DropdownMenuEntry<String>>[].obs;
  final finalStationList = <DropdownMenuEntry<String>>[].obs;
  StationModel? lastStartStation = StationModel();
  StationModel? lastFinalStation = StationModel();
  late Position postion;
  final isEnabled = false.obs;

  Metro metro = Metro();
  @override
  void dispose() {
    startStationCont.dispose();
    finalStationCont.dispose();
    textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    for (var station in metro.allStation) {
      startStationList.add(DropdownMenuEntry(value: station, label: station));
      finalStationList.add(DropdownMenuEntry(value: station, label: station));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Metro Egypt',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff9D2235),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),

            Obx(
              () => AppDropdownMenu(
                leadingIcon: IconButton(
                  onPressed: () async {
                    try {
                      Get.snackbar('Alert', 'Please Wait');
                      postion = await metro.determinePosition();
                    } on Exception catch (e) {
                      Get.snackbar('Error', e.toString());
                    }

                    startStationCont.text = metro.getNearestStation(
                      postion.latitude,
                      postion.longitude,
                    );
                  },
                  icon: Icon(Icons.location_on),
                ),
                hintText: 'Enter Start Station',

                controller: startStationCont,
                dropdownMenuEntry: startStationList.value,
                onSelected: (value) {
                  lastStartStation ??= StationModel();

                  if (lastStartStation!.name != null &&
                      !finalStationList.any(
                        (e) => e.value == lastStartStation!.name,
                      )) {
                    finalStationList.insert(
                      lastStartStation!.index!,
                      DropdownMenuEntry(
                        value: lastStartStation!.name!,
                        label: lastStartStation!.name!,
                      ),
                    );
                  }

                  lastStartStation!.name = value;
                  lastStartStation!.index = finalStationList.indexWhere(
                    (e) => e.value == value,
                  );

                  finalStationList.removeWhere((e) => e.value == value);
                },
              ),
            ),

            SizedBox(height: 20),
            Obx(
              () => AppDropdownMenu(
                hintText: 'Enter Final Station',
                leadingIcon: SizedBox(width: 28),
                controller: finalStationCont,
                dropdownMenuEntry: finalStationList.value,
                onSelected: (value) {
                  lastFinalStation ??= StationModel();

                  if (lastFinalStation!.name != null &&
                      !startStationList.any(
                        (e) => e.value == lastFinalStation!.name,
                      )) {
                    startStationList.insert(
                      lastFinalStation!.index!,
                      DropdownMenuEntry(
                        value: lastFinalStation!.name!,
                        label: lastFinalStation!.name!,
                      ),
                    );
                  }

                  lastFinalStation!.name = value;
                  lastFinalStation!.index = startStationList.indexWhere(
                    (e) => e.value == value,
                  );

                  startStationList.removeWhere((e) => e.value == value);
                },
              ),
            ),
            SizedBox(height: 20),

            AppButton(
              onPressed: () {
                details.value?.clear();
                final result = metro.getRoute(
                  startStationCont.text,
                  finalStationCont.text,
                );

                result.fold(
                  (error) {
                    Get.snackbar('Error', error);
                  },
                  (data) {
                    details.value = data;
                  },
                );
              },
              text: 'Show Me Details',
            ),
            Obx(
              () => details.value == null
                  ? SizedBox(height: 250)
                  : DetailsWidget(details: details),
            ),
            SizedBox(height: 120),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: textFieldController,
                      onChanged: (value) {
                        isEnabled.value = value.trim().isNotEmpty;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Destination',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Obx(() {
                  return AppButton(
                    onPressed: (isEnabled.value)
                        ? () async {
                            List<Location> locations = [];
                            try {
                              locations = await locationFromAddress(
                                textFieldController.text,
                              );
                            } on Exception catch (_) {
                              final result = metro.getRoute(
                                startStationCont.text,
                                textFieldController.text,
                              );
                              result.fold(
                                (error) {
                                  Get.snackbar('Error', error);
                                },
                                (data) {
                                  details.value = data;
                                },
                              );
                              return;
                            }
                            finalStationCont.text = metro.getNearestStation(
                              locations[0].latitude,
                              locations[0].longitude,
                            );
                          }
                        : null,
                    text: 'Go',
                  );
                }),
              ],
            ),

            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
