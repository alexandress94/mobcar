import 'dart:io';
import 'package:mobicar/futures/data/models/favorite_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDatabase {
  static const String _databaseName = 'mobcar.db';
  static const int _databaseVersion = 1;

  // Nome da tabela
  static const String _table = 'tb_favorite';

  // Nome da coluna da tabela TODO.
  static const String _columnId     = 'id_favorite';
  static const String _columnMarch  = 'ds_march';
  static const String _columnModel  = 'ds_model';
  static const String _columnYear   = 'nr_year';
  static const String _columnPrice  = 'nr_price';

  // Querey para alteração na estrutura da tabela.
  // ex: "ALTER TABLE $table ADD COLUMN $columnValue REAL NOT NULL"
  // ...
  static const String _createTableTodo = "CREATE TABLE $_table("
      "$_columnId INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$_columnMarch TEXT NOT NULL,"
      "$_columnModel TEXT NOT NULL,"
      "$_columnYear TEXT NOT NULL,"
      "$_columnPrice TEXT NOT NULL"
      ")";

  // Construtor privado.
  FavoriteDatabase._privateConstructor();
  static final FavoriteDatabase instance =
      FavoriteDatabase._privateConstructor();

  // Instanciando o banco de dados
  static Database? _database;

  // Criando o banco de dados.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inicializando o banco de dadaos.
  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + _databaseName;
    var todoDatabase = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate, /*onUpgrade: _onUpgrade,*/
    );
    return todoDatabase;
  }

  void _onCreate(Database database, int version) async {
    await database.execute(_createTableTodo);
  }

  //  Atualização de versão do banco.
  // Future<void> _onUpgrade(
  //     Database database, int oldVersion, int newVersion) async {
  //   if (oldVersion < 2) {
  //     database.execute('INSERIR A QUERY AQUI');
  //   } else {
  //     throw Exception('Falha na atualização de versão do banco!');
  //   }
  // }

  // Inserir registro.
  Future<int> insert(FavoriteModel model) async {
    Database database = await instance.database;
    var result = await database.insert(_table, model.toMap());
    print('CHAMOU INSERT');
    return result;
  }

  // Atualiza registro pelo id
  Future<int> update(FavoriteModel model) async {
    Database db = await instance.database;

    int result = await db.update(_table, model.toMap(),
        where: "$_columnId = ?", whereArgs: [model.id]);
    return result;
  }

  // Query todos os registros
  Future<List<Map<String, dynamic>>> query() async {
    Database db = await instance.database;
    return db.query(_table);
  }

  // Deleta registro pelo id
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_table, where: '$_columnId = ?', whereArgs: [id]);
  }

  // Desconecta do banco.
  Future close() async {
    Database db = await instance.database;
    db.close();
  }
}
