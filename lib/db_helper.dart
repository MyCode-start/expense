import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'models/cat_model.dart';
import 'models/expense_model.dart';


class DBHelper {

  //Expense Table

  static const String EXPENSE_TABLE = "expense";
  static const String EXPENSE_COLUMN_ID = "eid";
  static const String EXPENSE_COLUMN_TITLE = "title";
  static const String EXPENSE_COLUMN_DESC = "desc";
  static const String EXPENSE_COLUMN_AMT = "amount";
  static const String EXPENSE_COLUMN_BAL = "balance";
  static const String EXPENSE_COLUMN_CAT_ID = "cat_id";
  static const String EXPENSE_COLUMN_EXPENSE_TYPE = "expense_type";
  static const String EXPENSE_COLUMN_TIME = "time";

  //Category Table
  static const String CAT_TABLE = "expense_cat";
  static const String CAT_COLUMN_ID = "cat_id";
  static const String CAT_COLUMN_NAME = "name";
  static const String CAT_COLUMN_PATH = "img_path";


  Future<Database> openDB() async {
    var directory = await getApplicationDocumentsDirectory();

    await directory.create(recursive: true);

    var path = "${directory.path}expense_db.db";

    return await openDatabase(path, version: 1, onCreate: (db, version) {

      db.execute(
          "create table $EXPENSE_TABLE ( $EXPENSE_COLUMN_ID integer primary key autoincrement, "
              "$EXPENSE_COLUMN_TITLE text, $EXPENSE_COLUMN_DESC text, $EXPENSE_COLUMN_AMT real, "
              "$EXPENSE_COLUMN_BAL real, $EXPENSE_COLUMN_CAT_ID integer, $EXPENSE_COLUMN_EXPENSE_TYPE integer, "
              "$EXPENSE_COLUMN_TIME text)"
      );

      db.execute(
          "create table $CAT_TABLE ( $CAT_COLUMN_ID integer primary key autoincrement, $CAT_COLUMN_NAME text, "
              "$CAT_COLUMN_PATH text)"
      );


      db.insert(CAT_TABLE, CatModel(name: "Medicine", imgPath: "assets/images/category/drugs.png").toMap());
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Education", CAT_COLUMN_PATH: 'assets/images/category/education.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Salary", CAT_COLUMN_PATH: 'assets/images/category/employee.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Fast Food", CAT_COLUMN_PATH: 'assets/images/category/fast-food.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Grocery", CAT_COLUMN_PATH: 'assets/images/category/grocery.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Pet", CAT_COLUMN_PATH: 'assets/images/category/happy.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Market", CAT_COLUMN_PATH: 'assets/images/category/market.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Online Shopping", CAT_COLUMN_PATH: 'assets/images/category/online-shopping.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Loan", CAT_COLUMN_PATH: 'assets/images/category/signing.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Transport", CAT_COLUMN_PATH: 'assets/images/category/taxi.png'});
      db.insert(CAT_TABLE, {CAT_COLUMN_NAME : "Movie", CAT_COLUMN_PATH: 'assets/images/category/video-player.png'});

    });
  }

  Future<bool> addExpense(ExpenseModel expense) async{

    var myDB = await openDB();
    return await myDB.insert(EXPENSE_TABLE, expense.toMap())>0;

  }

  Future<List<ExpenseModel>> fetchData() async{

    var myDB = await openDB();

    List<Map<String, dynamic>> data;

    data = await myDB.query(EXPENSE_TABLE);

    List<ExpenseModel> arrExpense = [];

    for(Map<String, dynamic> expense in data){
      arrExpense.add(ExpenseModel.fromMap(expense));
    }
    return arrExpense;
  }


  Future<List<CatModel>> fetchAllCat() async{
    var myDB = await openDB();

    List<Map<String, dynamic>> data;

    data = await myDB.query(CAT_TABLE);

    List<CatModel> arrCat = [];

    for(Map<String, dynamic> category in data){
      arrCat.add(CatModel.fromMap(category));
    }

    return arrCat;
  }

}