
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:metro_egy/models/station_model.dart';

void Function(dynamic) onSelectedFinalStation(
  StationModel? lastFinalStation,
  RxList<DropdownMenuEntry<String>> startStationList,
) {
  return (value) {
    lastFinalStation ??= StationModel();

    if (lastFinalStation!.name != null &&
        !startStationList.any((e) => e.value == lastFinalStation!.name)) {
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
    
  };

  
}

void Function(dynamic) onSelectedStartStation(
  StationModel? lastStartStation,
  RxList<DropdownMenuEntry<String>> finalStationList,
) {
  return (value) {
    lastStartStation ??= StationModel();

    if (lastStartStation!.name != null &&
        !finalStationList.any((e) => e.value == lastStartStation!.name)) {
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
  };
}
