import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:memo/database/memo.dart';

final String tableName = 'memos';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
      // databse 경로 지정하는 method, 'path' 패키지의 'join' 함수를 사용해서 데이터베이스 확인
      join(await getDatabasesPath(), 'memos.db'),
      // 데이터베이스가 처음 생성될 때, memo를 저장하기 위한 테이블 생성 oncreate
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE memos(id INTEGER PRIMARY KEY, title TEXT, text TEXT, createTime TEXT, editTime TEXT)");
      },
      version: 1,
    );
    return _db;
  }

  Future<void> insertMemo(Memo memo) async {
    final db = await database;
    // Memo를 insert하는 함수,conflictAlgorithm 사용 -> 만약 동일한 memo가 여러번 추가되면, 이전 데이터를 덮어쓸 것
    await db.insert(
      tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Memo>> memos() async {
    final db = await database;

    //모든 Memo를 얻기 위해 테이블에 질의(query) 함
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(
        maps.length,
        (index) => Memo(
              id: maps[index]['id'],
              title: maps[index]['title'],
              text: maps[index]['text'],
              createTime: maps[index]['createTime'],
              editTime: maps[index]['editTime'],
            ));
  }

  Future<void> updateMemo(Memo memo) async {
    final db = await database;

    await db.update(tableName, memo.toMap(),
        // Memo의 id가 일치하는 지 확인
        where: "id = ?",
        // Memo의 id를 whereArg로 넘겨 SQL injection 방지
        whereArgs: [memo.id]);
  }

  Future<void> deleteMemo(Memo memo) async {
    final db = await database;

    await db.delete(
      tableName,
      // 특정 memo를 제거하기 위해 'where' 사용
      where: "id = ?",
      // Memo의 id를 where의 인자로 넘겨 SQL injection을 방지
      whereArgs: [memo.id],
    );
  }
}
