import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qrreader/models/scan_model.dart';
export 'package:qrreader/models/scan_model.dart';


class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();  //constructor privado de un singleton
  DBProvider._();

  Future <Database> get database async{
    if(_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future <Database> initDB() async{

    //Path de donde almacenaremos la base de datos
    Directory documentsDirectory =  await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db'); //siempre colocar la extensión .db);
    print(path);

    //crear base de datos
    return await openDatabase(
      path,
      version: 1,  //Siempre que actualizamos la estructura la bd con tablas, etc, aumentar la versión en 1 (crear, eliminar, etc)
      onOpen: (db){},
     onCreate: (Database db, int version)async{
       await db.execute('CREATE TABLE Scans(id INTEGER PRIMARY KEY AUTOINCREMENT, tipo TEXT, valor TEXT);');
      }
    );

  }

//EL QUE LA MAYORÍA DE GENTE USA :D PERO ES MÁS DIFÍCIL XD
  Future <int>newScanRaw( ScanModel newScan ) async{

    final id    = nuevoScan.id;
   final tipo   = nuevoScan.tipo;
    final valor = nuevoScan.valor;  

    //Verificar la base de datos
    final db = await database;

   //Inserción de datos
   final res = await db.rawInsert('INSERT INTO Scans( id, tipo, valor) VALUES ( $id, $tipo, $valor)');

    return res;
  }



//RECOMENDADO POR FERNANDO, MÁS FÁCIL
  Future <int> nuevoScan(ScanModel nuevoScan) async{
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson()); //inserta todos los datos definidos en el scan model
    print(res);

    //Es el ID del último registro ingresado;
    return res;
  }



}