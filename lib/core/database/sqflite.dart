import 'package:mizan_app/models/installments_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  static Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Installments.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        Batch batch = db.batch();
        batch.execute('''
CREATE TABLE Installments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  monthlyinstallment REAL,
  dateTime TEXT,
  comments TEXT
);
''');
        batch.commit();
      },
    );
  }

  static Database? database;
  static Future<Database> getDatabase() async {
    if (database != null) return database!;
    database = await initDatabase();
    return database!;
  }

  static Future<void> insert(InstallmentsModel installments) async {
    Database db = await getDatabase();

    Batch batch = db.batch();
    batch.insert('Installments', installments.toMap());
    batch.commit();
  }

  static Future<List<InstallmentsModel>> loudInstallments() async {
    Database db = await getDatabase();

    List<Map> databasemaps = await db.query('Installments');
    List<InstallmentsModel> installments = [];
    for (Map i in databasemaps) {
      InstallmentsModel installmentsModel = InstallmentsModel(
        id: i['id'],
        monthlyinstallment: i['monthlyinstallment'],
        dateTime: i['dateTime'],

        comments: i['comments'],
      );
      installments.add(installmentsModel);
    }
    return installments;
  }

  static Future<void> delete(int id) async {
    Database db = await getDatabase();
    await db.delete('Installments', where: 'id=?', whereArgs: [id]);
  }

  static Future update(InstallmentsModel installment) async {
    Database db = await getDatabase();
    Batch batch = db.batch();

    batch.update(
      'Installments',
      installment.toMap(),
      where: 'id=?',
      whereArgs: [installment.id],
    );
    batch.commit();
  }
}
