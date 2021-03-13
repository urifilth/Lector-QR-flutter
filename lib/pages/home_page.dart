import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qrreader/pages/direcciones_page.dart';

import 'package:qrreader/providers/db_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';

import 'package:qrreader/widgets/custom_navigatorbar.dart';
import 'package:qrreader/widgets/scan_button.dart';

 import 'mapa_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever), 
            onPressed: (){}
            ),
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    
    //Cambiar para mostrar la página respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: TEMPORAL LEER LA BASE DE DATOS.
    final tempScan = new ScanModel(valor: 'http://google.com');
    final intTemp = DBProvider.db.nuevoScan(tempScan);
    print (intTemp);

    switch( currentIndex ) {
      
      case 0:
      return MapaPage();
      
      case 1:
      return DireccionPage();

      default:
      return MapaPage();
    }
  }
}