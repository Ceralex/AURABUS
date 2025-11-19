import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final stopDetailsProvider = FutureProvider.family<List<dynamic>, String>((
  ref,
  stopId,
) async {
  final response = await http.get(
    Uri.parse("http://192.168.1.37:8888/stops/$stopId"),
  );

  if (response.statusCode != 200) {
    throw Exception("Failed to load stop details");
  }

  return jsonDecode(response.body) as List<dynamic>;
});

class StopDetailsPage extends ConsumerWidget {
  final String stopId;

  const StopDetailsPage({super.key, required this.stopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopAsync = ref.watch(stopDetailsProvider(stopId));

    return Scaffold(
      appBar: AppBar(title: Text("Stop $stopId")),
      body: stopAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              const JsonEncoder.withIndent("  ").convert(data),
              style: const TextStyle(fontFamily: "monospace"),
            ),
          );
        },
      ),
    );
  }
}
