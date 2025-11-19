import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:aurabus/features/map/data/map_providers.dart';
import 'map_controller.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final LatLng _center = const LatLng(46.0678, 11.1303);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final mapController = ref.read(mapControllerProvider);

    final mapStyleAsync = ref.watch(mapStyleProvider);
    final mapStyle = mapStyleAsync.value;

    final rawMarkers = ref.watch(markersProvider).value ?? {};

    final markers = rawMarkers.map((marker) {
      return marker.copyWith(
        onTapParam: () {
          final stopId = marker.markerId.value;
          mapController.openStopModal(context, stopId);
        },
      );
    }).toSet();

    return GoogleMap(
      initialCameraPosition: CameraPosition(target: _center, zoom: 13),
      onMapCreated: mapController.onMapCreated,
      style: mapStyle,
      markers: markers,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
    );
  }
}
