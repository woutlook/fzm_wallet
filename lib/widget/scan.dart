import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  final Function(BarcodeCapture) onScan;
  const ScanPage({super.key, required this.onScan});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      onDetect: (BarcodeCapture barcodeCapture) {
        widget.onScan(barcodeCapture);
      },
    );
  }
}
