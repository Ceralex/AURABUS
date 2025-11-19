import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:aurabus/features/map/presentation/stop_details_modal.dart';

import 'package:aurabus/features/map/data/map_providers.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends ConsumerState<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(46.067808715456785, 11.130308912105304);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final mapStyleAsync = ref.watch(mapStyleProvider);
    final markersAsync = ref.watch(markersProvider);

    final mapStyle = mapStyleAsync.value;
    final rawMarkers = markersAsync.value ?? {};

    // Add "onTap" directly to markers
    final markers = rawMarkers
        .map(
          (marker) => marker.copyWith(
            onTapParam: () {
              final stopId = marker.markerId.value;

              // Open bottom modal sheet
              showModalBottomSheet(
                context: context,
                useSafeArea: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => StopDetailsModal(stopId: stopId),
              );
            },
          ),
        )
        .toSet();

    return GoogleMap(
      onMapCreated: (controller) {
        _onMapCreated(controller);
        if (mapStyle != null) controller.setMapStyle(mapStyle);
      },
      initialCameraPosition: CameraPosition(target: _center, zoom: 13.0),
      markers: markers,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
    );
  }
}
