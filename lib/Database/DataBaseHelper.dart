import 'dart:async';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'takipPlus.db');
    return await openDatabase(
      path,
      version: 5,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  Future<void> _upgradeDatabase(
      Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 5) {
      // Eğer 2. versiyondan önce bir güncelleme varsa burada işlemleri gerçekleştirin.
      try {
        await db.execute('ALTER TABLE MusteriTablo ADD COLUMN musteriAdi TEXT');
      } catch (e) {
        print('Hata: $e');
      }
    }
  }

  Future<void> _createDatabase(Database db, int version) async {
    if (version > 1) {
      // Eğer versiyon 1'den büyükse, güncelleme yapılacak demektir.

      await db.execute('DROP TABLE IF EXISTS MusteriTablo');
    }

    await db.execute('''
      CREATE TABLE UrunTablo (
        id INTEGER PRIMARY KEY,
        urunAdi TEXT,
        barkodNo TEXT,
        urunAdet INTEGER,
        urunAciklama TEXT,
        urunFoto BLOB
      )
    ''');

    await db.execute('''
      CREATE TABLE DepolarTablo (
        id INTEGER PRIMARY KEY,
        depoAdi TEXT,
        depoTelNo TEXT,
        depoAdres TEXT,
        depoSehir TEXT
        
      )
    ''');

    await db.execute('''
      CREATE TABLE MusteriTablo (
        id INTEGER PRIMARY KEY,
        musteriAdSoyad TEXT,
        musteriTelNo TEXT,
        musteriAdres TEXT,
        musteriEposta TEXT,
        musteriAciklama TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE UyeTablo (
        id INTEGER PRIMARY KEY,
        uyeAdSoyad TEXT,
        uyeEposta TEXT,
        uyeSifre TEXT,
        uyeSifreTekrar TEXT
      )
    ''');
  }

//ÜRÜNLER TABLOSU EKLEME VE SİLME
  Future<int> insertUrun(String urunAdi, String barkodNo, int urunAdet,
      String urunAciklama, Uint8List urunFoto) async {
    final Database db = await database;
    try {
      await db.insert(
        'UrunTablo',
        {
          'urunAdi': urunAdi,
          'barkodNo': barkodNo,
          'urunAdet': urunAdet,
          'urunAciklama': urunAciklama,
          'urunFoto': urunFoto
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return 1; // Ekleme başarılı
    } catch (e) {
      print('Hata: $e');
      return 0; // Ekleme başarısız
    }
  }

  Future<int> deleteUrun(int id) async {
    final Database db = await database;
    try {
      return await db.delete(
        'UrunTablo',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Hata: $e');
      return 0; // Silme başarısız
    }
  }

//DEPO TABLOSU EKLEME VE SİLME
  Future<void> insertDepo(String depoAdi, String depoTelNo, String depoSehir,
      String depoAdres) async {
    final Database db = await database;
    await db.insert(
      'DepolarTablo',
      {
        'depoAdi': depoAdi,
        'depoTelNo': depoTelNo,
        'depoSehir': depoSehir,
        'depoAdres': depoAdres
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteDepo(int id) async {
    final Database db = await database;
    try {
      return await db.delete(
        'DepolarTablo',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Hata: $e');
      return 0; // Silme başarısız
    }
  }

//MÜŞTERİ TABLOSU EKLEME VE SİLME
  Future<void> insertMusteri(String musteriAdi, String musteriTelNo,
      String musteriAdres, String musteriEposta, String musteriAciklama) async {
    final Database db = await database;
    await db.insert('MusteriTablo', {
      'musteriAdi': musteriAdi,
      'musteriTelNo': musteriTelNo,
      'musteriAdres': musteriAdres,
      'musteriEposta': musteriEposta,
      'musteriAciklama': musteriAciklama
    });
  }

  Future<int> deleteMusteri(int id) async {
    final Database db = await database;
    try {
      return await db.delete(
        'MusteriTablo',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Hata: $e');
      return 0; // Silme başarısız
    }
  }

//UYE TABLOSU EKLEME VE SİLME
  Future<void> insertUye(String uyeAdSoyad, String uyeEposta, String uyeSifre,
      String uyeSifreTekrar) async {
    final Database db = await database;
    await db.insert('UyeTablo', {
      'uyeAdSoyad': uyeAdSoyad,
      'uyeEposta': uyeEposta,
      'uyeSifre': uyeSifre,
      'uyeSifreTekrar': uyeSifreTekrar
    });
  }

  Future<int> deleteUye(int id) async {
    final Database db = await database;
    try {
      return await db.delete(
        'UrunTablo',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Hata: $e');
      return 0; // Silme başarısız
    }
  }

  Future<List<Map<String, dynamic>>> queryAllUrunData() async {
    final Database db = await database;
    return await db.query('UrunTablo');
  }

  Future<List<Map<String, dynamic>>> queryAllDepoData() async {
    final Database db = await database;
    return await db.query('DepolarTablo');
  }

  Future<List<Map<String, dynamic>>> queryAllMusteriData() async {
    final Database db = await database;
    return await db.query('MusteriTablo');
  }

  Future<List<Map<String, dynamic>>> queryAllUyeData() async {
    final Database db = await database;
    return await db.query('UyeTablo');
  }
}
