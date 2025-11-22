import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'models/stop_data.dart';

class MapRepository {
  final String baseUrl = dotenv.env['API_BASE_URL'] ?? "http://localhost:8888";

  Future<List<StopData>> fetchStops() async {
    final res = await http.get(Uri.parse("$baseUrl/stops"));
    if (res.statusCode != 200) throw Exception("Failed to fetch stops");

    final jsonList = jsonDecode(res.body) as List<dynamic>;
    return jsonList.map((e) => StopData.fromJson(e)).toList();
  }

  Future<List<dynamic>> fetchStopDetails(String stopId) async {
    final res = await http.get(Uri.parse("$baseUrl/stops/$stopId"));
    if (res.statusCode != 200) throw Exception("Failed details");

    return jsonDecode(res.body);
  }
}
