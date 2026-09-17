import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  // to implement function to create table and work on database
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "sql_try_me.db");
    Database myDataBase = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
    return myDataBase;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async{
    // ALTER TABLE table name ADD COLUMN  column name restrict
    await db.execute('''ALTER TABLE ''');
  }
  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "user" (
    "id" INTEGER PRIMARY KEY  NOT NULL AUTOINCREMENT,
    "full_name" TEXT NOT NULL,
    "email" TEXT NOT NULL ,
    "password" INTEGER NOT NULL ,
    "address" TEXT NOT NULL ,
    "mobile" TEXT NOT NULL 
    )
    ''');
    await db.execute('''
    CREATE TABLE "admin" (
    "id" INTEGER NOT NULL  PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL 
     )    
    ''');
    await db.execute('''
    PRAGMA foreign_keys = ON;
    CREATE TABLE "categories" (
    "id" INTEGER NOT NULL  PRIMARY KEY AUTOINCREMENT,
    "categories_name" TEXT NOT NULL,
    "categories_image" TEXT NOT NULL,
    "product_id" INTEGER 
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT ON UPDATE RESTRICT
    )
     ''');

    await db.execute('''
    PRAGMA foreign_keys = ON;
    CREATE TABLE "order"(
    "id" INTEGER NOT NULL  PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER ,
    "product_id" INTEGER ,
    "order_date" TEXT,
    "total_price" REAL ,
    "states" TEXT ,
    "user_id" INTEGER,
    "product_id" INTEGER
     FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE RESTRICT ON UPDATE RESTRICT
     FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT ON UPDATE RESTRICT
     FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE RESTRICT ON UPDATE RESTRICT
     FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE RESTRICT ON UPDATE RESTRICT
    )
    ''');
    await db.execute('''
    PRAGMA foreign_keys=ON;
    CREATE TABLE "products"(
    "id" INTEGER NOT NULL  PRIMARY KEY AUTOINCREMENT,
    "category_id" INTEGER,
    "admin_id" INTEGER,
    "product_name" TEXT NOT NULL,
    "description" TEXT,
    "price" REAL NOT NULL,
    "stock_quantity" INTEGER ,
    "rating" INTEGER ,
    "image" TEXT,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (admin_id) REFERENCES admin(id) ON DELETE RESTRICT ON UPDATE RESTRICT

    )
    
    ''');
    await db.execute('''
    PRAGMA foreign_keys=ON;
    CREATE TABLE "cart"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER,
    "product_id" INTEGER,
    "quantity" INTEGER,
    "total_price" REAL,
    FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE RESTRICT ON UPDATE RESTRICT
    )
    ''');
    await db.execute('''
    PRAGMA foreign_keys=ON;
    CREATE TABLE "reservation"(
    "order_id" INTEGER,
    "cart_id" INTEGER
    
    FOREIGN KEY (order_id) REFERENCE order (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (cart_id) REFERENCE cart (id) ON DELETE RESTRICT ON UPDATE RESTRICT
        
    )
    
    ''');
    await db.execute('''
    PRAGMA foreign_keys=ON;
    CREATE TABLE "is_selected"(
    "cart_id" INTEGER,
    "product_id" INTEGER,
    
    FOREIGN KEY (cart_id) REFERENCE cart (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (product_id) REFERENCE products (id) ON DELETE RESTRICT ON UPDATE RESTRICT
    )
    
    ''');

    await db.execute('''
    PRAGMA foreign_keys=ON;
    CREATE TABLE "add_product"(
    "admin_id" INTEGER,
    "product_id" INTEGER,
    
    FOREIGN KEY (admin_id) REFERENCE admin (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (product_id) REFERENCE products (id) ON DELETE RESTRICT ON UPDATE RESTRICT
    
    )
    
    ''');

  }

  //Select
  readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(
      sql,
      // or write here select query command
    );
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(
      sql,
      //or write insert query command here
    );
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(
      sql,
      //or write here update query command
    );
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(
      sql,
      //or write delete query command here
    );
    return response;
  }
}
