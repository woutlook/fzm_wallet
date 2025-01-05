import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  final Function(BarcodeCapture) onScan;
  const Scan({super.key, required this.onScan});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      onDetect: (BarcodeCapture barcodeCapture) {
        widget.onScan(barcodeCapture);
      },
    );
  }
}
