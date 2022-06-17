import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'items.dart';

class DB {
  Database? _database;
  DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'mydb.db';
    final path = join(dbpath, dbname);

    _database = await openDatabase(path , version: 3, onCreate: _initDataBase);
    return _database!;
  }

  Future<void> _initDataBase(Database db, int version ) async{
      // add the purchase date
      await db.execute('''
      CREATE TABLE items(
      theId INTEGER PRIMARY KEY AUTOINCREMENT, 
      theName TEXT,
      theManufacturedDate TEXT,
      theExpirationDate TEXT,
      theBestBefore TEXT
      
      )
      '''
      );
  }


  Future<void> addNewItem(Item newItem) async {

    final db = await database;
    db.insert("items",
        newItem.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  Future<void> deleteItem(Item item) async {
    final db = await database;
    db.delete(
      'items',
      where: 'theId == ?',
      whereArgs: [item.theId]
    );
  }

  Future<void> deleteAll() async {
    final db = await database;
    db.delete('items');
  }

  Future<List<Item>> getItem(String sortType) async {
    final db = await database;

    List<Map<String, dynamic>> items ;
    if (sortType == 'EXP') {
      items = await db.query("items",
          orderBy: 'theExpirationDate ASC');
    }
    else if (sortType == 'BBF') {
      items = await db.query("items",
          orderBy: 'theBestBefore ASC');
    }
    else {
      items = await db.query("items",
          orderBy: 'theManufacturedDate ASC');
    }
    return List.generate(items.length,
            (i) => Item(
              theId: items[i]['theId'],
              theName: items[i]['theName'],
              theManufacturedDate: DateTime.parse(items[i]['theManufacturedDate']),
              theExpirationDate: DateTime.tryParse(items[i]['theExpirationDate']),
              // theExpirationDate: DateTime.parse(items[i]['theExpirationDate']),

              theBestBefore: DateTime.tryParse(items[i]['theBestBefore'])

            )
          );
  }
}

