import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_repository.dart';
import 'map_marker_loader.dart';
import 'models/stop_data.dart';
import 'models/stop_details.dart';

final mapRepositoryProvider = Provider((ref) => MapRepository());

final mapStyleProvider = FutureProvider<String?>((ref) async {
  ref.keepAlive(); // ok for expensive map-style loads
  try {
    return await rootBundle.loadString('assets/map_style.json');
  } catch (_) {
    return null;
  }
});

final stopIconProvider = FutureProvider<BitmapDescriptor>((ref) async {
  ref.keepAlive();
  return MapMarkerLoader.loadStopIcon();
});

final markersProvider = FutureProvider<Set<Marker>>((ref) async {
  ref.keepAlive();

  final repo = ref.read(mapRepositoryProvider);
  final icon = await ref.read(stopIconProvider.future);
  final stops = await repo.fetchStops();

  return stops.map((StopData stop) {
    return Marker(
      markerId: MarkerId(stop.stopId.toString()),
      position: LatLng(stop.stopLat, stop.stopLon),
      icon: icon,
      consumeTapEvents: true,
      infoWindow: InfoWindow(title: stop.stopName),
    );
  }).toSet();
});

final stopDetailsProvider = FutureProvider.family<List<StopArrival>, String>((
  ref,
  stopId,
) async {
  final repo = ref.read(mapRepositoryProvider);
  return repo.fetchStopDetails(stopId);
});

class SelectedLinesNotifier extends StateNotifier<Set<String>> {
  SelectedLinesNotifier() : super({});

  void toggle(String routeShortName) {
    if (state.contains(routeShortName)) {
      final newState = {...state};
      newState.remove(routeShortName);
      state = newState;
    } else {
      state = {...state, routeShortName};
    }
  }

  void clear() => state = {};
}

final selectedLinesProvider =
    StateNotifierProvider<SelectedLinesNotifier, Set<String>>(
      (ref) => SelectedLinesNotifier(),
    );
