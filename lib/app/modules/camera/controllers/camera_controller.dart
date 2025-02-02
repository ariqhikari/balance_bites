import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class CameraController extends GetxController {
  BarcodeViewController? barcodeController;
  var result = ''.obs;

  void onScanned(String code) {
    result.value = code;
    print('masuk');
    print('result: $result');
  }

  void onBarcodeViewCreated(BarcodeViewController controller) {
    barcodeController = controller;
  }

  void toggleFlash() {
    barcodeController?.toggleFlash();
  }

  void pauseScanning() {
    barcodeController?.pauseScanning();
  }

  void resumeScanning() {
    barcodeController?.resumeScanning();
  }
}
