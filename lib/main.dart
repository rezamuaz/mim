import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mim/myapp.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  runApp(const MyApp());
}
