import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aurabus/features/map/presentation/stop_details_page.dart';

class StopDetailsModal extends ConsumerWidget {
  final String stopId;

  const StopDetailsModal({super.key, required this.stopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopAsync = ref.watch(stopDetailsProvider(stopId));

    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.85,
      initialChildSize: 0.45,
      minChildSize: 0.3,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: stopAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text("Error: $err")),
            data: (data) {
              return ListView(
                controller: controller,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Text(
                    "Stop $stopId",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Raw data:\n\n${const JsonEncoder.withIndent("  ").convert(data)}",
                    style: const TextStyle(fontFamily: "monospace"),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
