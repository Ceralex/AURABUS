import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:aurabus/core/models/stop_data.dart';

final mapStyleProvider = FutureProvider<String?>((ref) async {
  ref.keepAlive();
  try {
    final style = await rootBundle.loadString('assets/map_style.json');
    debugPrint("Style loaded successfully.");
    return style;
  } catch (e) {
    debugPrint("Error loading style: $e");
    return null;
  }
});

final customMarkerProvider = FutureProvider<BitmapDescriptor>((ref) async {
  ref.keepAlive();
  final icon = BitmapDescriptor.asset(
    ImageConfiguration(size: Size(24, 24)),
    'assets/bus_stop_icon.png',
  );

  return icon;
});

final markersProvider = FutureProvider<Set<Marker>>((ref) async {
  ref.keepAlive();
  final icon = await ref.watch(customMarkerProvider.future);

  final response = await http.get(Uri.parse('http://192.168.1.37:8888/stops'));

  final List<dynamic> stopsJson = json.decode(response.body);
  final Set<Marker> markers = {};

  for (var stopJson in stopsJson) {
    final stop = StopData.fromJson(stopJson);

    markers.add(
      Marker(
        markerId: MarkerId(stop.stopId.toString()),
        position: LatLng(stop.stopLat, stop.stopLon),
        icon: icon,
        consumeTapEvents: true, // prevents info window
        onTap: () {
          // We'll handle tap in the MapScreen using copyWith
        },
        // infoWindow: const InfoWindow.noText, // disable entirely
      ),
    );
  }

  return markers;
});

final appIsReadyProvider = Provider<AsyncValue<void>>((ref) {
  final mapStyle = ref.watch(mapStyleProvider);
  final markers = ref.watch(markersProvider);

  if (mapStyle.isLoading || markers.isLoading) {
    return const AsyncValue.loading();
  }
  if (mapStyle.hasError || markers.hasError) {
    return AsyncValue.error('Unable to load assets.', StackTrace.current);
  }

  return const AsyncValue.data(null);
});
