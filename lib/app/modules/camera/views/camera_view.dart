import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 500,
              child: SimpleBarcodeScanner(
                scaleHeight: 500,
                scaleWidth: 500,
                onScanned: controller.onScanned,
                // delayMillis: 2000,
                scanFormat: ScanFormat.ONLY_BARCODE,
                onBarcodeViewCreated: controller.onBarcodeViewCreated,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(controller.result.value)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.toggleFlash,
              child: const Text("Toggle Flash"),
            ),
            ElevatedButton(
              onPressed: controller.pauseScanning,
              child: const Text("Pause Scanning"),
            ),
            ElevatedButton(
              onPressed: controller.resumeScanning,
              child: const Text("Resume Scanning"),
            ),
          ],
        ),
      ),
    );
  }
}
