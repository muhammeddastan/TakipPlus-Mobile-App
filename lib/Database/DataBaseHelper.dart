import 'dart:async';
import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:takip_plus/Models/UyeModel.dart';
import 'package:takip_plus/Pages/Giris/Login-SignUp/GirisYap.dart';

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

    return await openDatabase(path,
        version: 1, onCreate: _createDatabase, onUpgrade: _upgradeDatabase);
  }

  Future<void> _upgradeDatabase(
      Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Önceki versiyonlardan 2. versiyona geçişte yapılacak işlemler
      // await db.execute('ALTER TABLE MusteriTablo ADD COLUMN musteriAdi TEXT');
    }
    if (oldVersion < 3) {
      // 2. versiyondan 3. versiyona geçişte yapılacak işlemler
      // Örneğin, yeni bir tablo ekleyebilirsiniz.
      // await db
      //     .execute('CREATE TABLE YeniTablo (id INTEGER PRIMARY KEY, ad TEXT)');
    }
    // Diğer versiyon güncellemelerini buraya ekleyebilirsiniz.
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('DROP TABLE IF EXISTS UrunTablo');
    await db.execute('DROP TABLE IF EXISTS DepolarTablo');
    await db.execute('DROP TABLE IF EXISTS MusteriTablo');
    await db.execute('DROP TABLE IF EXISTS UyeTablo');
    await db.execute('DROP TABLE IF EXISTS GelirTablo');
    await db.execute('DROP TABLE IF EXISTS GiderTablo');

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

    await db.execute('''
    CREATE TABLE GelirTablo (
      id INTEGER PRIMARY KEY,
      kullaniciId INTEGER,
      gelirAdi TEXT, 
      gelirTip TEXT,
      gelirPara INTEGER,
      gelirTarih TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE GiderTablo (
      id INTEGER PRIMARY KEY,
      kullaniciId INTEGER,
      giderAdi TEXT,
      giderTip TEXT,
      giderPara INTEGER,
      giderTarih TEXT
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
  Future<void> insertMusteri(String musteriAdSoyad, String musteriTelNo,
      String musteriAdres, String musteriEposta, String musteriAciklama) async {
    final Database db = await database;
    await db.insert('MusteriTablo', {
      'musteriAdSoyad': musteriAdSoyad,
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
  Future<void> insertUye(
    String uyeAdSoyad,
    String uyeEposta,
    String uyeSifre,
  ) async {
    final Database db = await database;
    await db.insert('UyeTablo', {
      'uyeAdSoyad': uyeAdSoyad,
      'uyeEposta': uyeEposta,
      'uyeSifre': uyeSifre
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

  //GELİRLER TABLOSU EKLEME VE SİLME
  Future<void> insertGelir(String gelirAdi, String gelirTip, int gelirPara,
      String gelirTarih) async {
    final Database db = await database;
    await db.insert('GelirTablo', {
      'gelirAdi': gelirAdi,
      'gelirTip': gelirTip,
      'gelirPara': gelirPara,
      'gelirTarih': gelirTarih,
      'kullaniciId': LoginPage.girisYapanKullanici?.id
    });
  }

  Future<int> deleteGelir(int id) async {
    final Database db = await database;
    try {
      return await db.delete('GelirTablo', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print('Hata: $e');
      return 0;
    }
  }

  //GİDERLER TABLOSU EKLEME VE SİLME
  Future<void> insertGider(String giderAdi, String giderTip, int giderPara,
      String giderTarih) async {
    final Database db = await database;
    await db.insert('GiderTablo', {
      'giderAdi': giderAdi,
      'giderTip': giderTip,
      'giderPara': giderPara,
      'giderTarih': giderTarih,
      'kullaniciId': LoginPage.girisYapanKullanici?.id
    });
  }

  Future<int> deleteGider(int id) async {
    final Database db = await database;
    try {
      return await db.delete('GiderTablo', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print('Hata: $e');
      return 0;
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

//UYE İŞLEMLERİ
  Future<List<Map<String, dynamic>>> queryAllUyeData() async {
    final Database db = await database;
    return await db.query('UyeTablo');
  }

//GELİR - GİDER İŞLEMLERİ
  Future<List<Map<String, dynamic>>> queryAllGelirData() async {
    final Database db = await database;
    return await db.query('GelirTablo',
        where: 'kullaniciId = ?',
        whereArgs: [LoginPage.girisYapanKullanici?.id]);
  }

  Future<List<Map<String, dynamic>>> getLastGelirData() async {
    final Database db = await database;
    return await db.rawQuery(
        "SELECT * FROM GelirTablo WHERE kullaniciId = ${LoginPage.girisYapanKullanici?.id} ORDER BY gelirTarih DESC LIMIT 1");
  }

  Future<List<Map<String, dynamic>>> queryAllGiderData() async {
    final Database db = await database;
    return await db.query('GiderTablo',
        where: 'kullaniciId = ?',
        whereArgs: [LoginPage.girisYapanKullanici?.id]);
  }

  Future<List<Map<String, dynamic>>> getLastGiderData() async {
    final Database db = await database;
    return await db.rawQuery(
        "SELECT * FROM GiderTablo WHERE kullaniciId = ${LoginPage.girisYapanKullanici?.id} ORDER BY giderTarih DESC LIMIT 1");
  }

  //LOGİN İŞLEMLERİ
  Future<bool> login(String uyeEposta, String uyeSifre) async {
    final db = await instance.database;
    final result = await db.query(
      'UyeTablo',
      where: 'uyeEposta = ? AND uyeSifre = ?',
      whereArgs: [uyeEposta, uyeSifre],
    );

    if (result.isNotEmpty) {
      LoginPage.girisYapanKullanici = UyeModel.fromMap(result[0]);

      return true;
    } else {
      return false;
    }
  }

//EPOSTA KONTROL
  Future<bool> ePostaDogrulama(String uyeEposta) async {
    final db = await instance.database;
    final result = await db.query(
      'UyeTablo',
      where: 'uyeEposta = ?',
      whereArgs: [uyeEposta],
    );

    return result.isNotEmpty;
  }
}
