import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: ()async{

        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF','Salir del escaner', false, ScanMode.QR);
        final barcodeScanRes = 'httpss//steam.com/id/urifilth';

        
        print( barcodeScanRes );
      },
    );
  }
}