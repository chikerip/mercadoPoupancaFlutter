// ignore_for_file: file_names, camel_case_types, unnecessary_cast
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class barcodeScan extends StatefulWidget {
  const barcodeScan({super.key});

  @override
  State<barcodeScan> createState() => _barcodeScan();
}

class _barcodeScan extends State<barcodeScan> {
  MobileScannerController cameraController = MobileScannerController();
  bool scanned = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
    body: Stack(
      children: [
        MobileScanner(
          // fit: BoxFit.contain,
          controller: cameraController,
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            for (final barcode in barcodes) {
              if(scanned == false){
                Navigator.of(context).pushNamed('/product', arguments: barcode.rawValue!);
                setState(() {
                  scanned = true;
                });
              } else {
                setState(() {
                  scanned = false;
                });
              }
            }
          },
        ),
        Positioned(
          top: 0,
          // ignore: sized_box_for_whitespace
          child: Container(
            width: screenWidth,
            height: screenheight * 0.1,
            child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
          )
          )
        ]
      ),
    );
  }
}
