import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yexder_mobile_client/global/database/database_model_interface.dart';
import 'package:yexder_mobile_client/global/models/account/user_model.dart';

class DatabaseService { 
  static Database? database;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database?> get databaseInstance async {
    return database ?? await getInstance();
  }

  Future<Database> getInstance() async {
    final databaseDirectoryPath = await getDatabasesPath();
    final databasePath = join(databaseDirectoryPath, "yexider_local_storage.db");
    
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (database, version) {
        database.execute(UserModel.empthy().createTable());
      },
      onOpen: (database) {
        // database.execute('DROP TABLE ${UserModel.empthy().tableName}');
        // database.execute(UserModel.empthy().createTable());
      }
    );

    return database;
  }

  Future<void> setModelFieldsById(IDatabaseModel? model) async {
    final database = await DatabaseService.instance.databaseInstance;

    final maps = await database?.query(
      model!.tableName,
      where: 'id = ?',
      whereArgs: [model.id],
    );

    if (maps!.isNotEmpty == true) {
      model = IDatabaseModel.fromMap(maps.first);
    }

    model = null;
  }

  Future<void> deleteModel(IDatabaseModel model) async {
    final database = await DatabaseService.instance.databaseInstance;
    await database?.delete(model.tableName, where: 'id = ?', whereArgs: [model.id]);
  }

  Future<bool> createOrUpdateRecord(IDatabaseModel model) async {
    final database = await DatabaseService.instance.databaseInstance;

    if (model.id != null) {
      final records = await database?.query(
        model.tableName,
        where: 'id = ?',
        whereArgs: [model.id],
      );

      if (records != null && records.isNotEmpty) {
        await database?.update(
          model.tableName,
          model.toJson(),
          where: 'id = ?',
          whereArgs: [model.id],
        );
        return true;
      }
    }

    await database?.insert(
      model.tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return false;
  }
}