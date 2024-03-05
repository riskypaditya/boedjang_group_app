import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'pages/home.dart';
import 'services/camera.service.dart';
import 'services/face_detector_service.dart';
import 'services/ml_service.dart';

void main() async {
  final locator = GetIt.instance;
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator
      .registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
  locator.registerLazySingleton<MLService>(() => MLService());
  final MLService mlService = locator<MLService>();
  final FaceDetectorService mlKitService = locator<FaceDetectorService>();
  final CameraService cameraService = locator<CameraService>();
  await cameraService.initialize();
  await mlService.initialize();
  mlKitService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}
