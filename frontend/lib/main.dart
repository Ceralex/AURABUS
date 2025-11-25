import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:aurabus/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (await File('.env').exists()) {
      await dotenv.load();
    }
  } catch (e) {
    // Ignore errors related to loading the .env file
  }

  runApp(const ProviderScope(child: MyApp()));
}
