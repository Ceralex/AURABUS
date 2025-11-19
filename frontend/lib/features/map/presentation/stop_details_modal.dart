import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aurabus/features/map/data/map_providers.dart';

class StopDetailsModal extends ConsumerWidget {
  final String stopId;

  const StopDetailsModal({super.key, required this.stopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(stopDetailsProvider(stopId));

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      maxChildSize: 0.85,
      builder: (_, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(16),
          child: async.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text("Error: $e"),
            data: (data) => ListView(
              controller: controller,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Stop $stopId",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  const JsonEncoder.withIndent("  ").convert(data),
                  style: const TextStyle(fontFamily: "monospace"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
