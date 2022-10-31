import 'package:habitstats/models/routine.dart';
import 'package:isar/isar.dart';

class DataBaseService {
  static DataBaseService? _dataBaseService;

  late final Isar database;

  static DataBaseService get instance {
    if (_dataBaseService == null) {
      throw Exception('DataBaseService is not initialized, make sure to call ensureInitialized before getting instance');
    }
    return _dataBaseService!;
  }

  DataBaseService._();

  static Future<DataBaseService> ensureInitialized() async {
    _dataBaseService ??= DataBaseService._();

    await DataBaseService.instance._initializeSharedPreferences();

    return DataBaseService.instance;
  }

  Future<void> _initializeSharedPreferences() async {
    database = await Isar.open([RoutineSchema]);
  }

  Future<List<Routine>> get allRoutines {
    return database.routines.where().findAll();
  }

  Future<void> createAndSaveRoutine(title, description, difficulty) async {
    final newRoutine = Routine()
      ..title = title
      ..description = description
      ..difficulty = difficulty;

    await database.writeTxn(() async {
      await database.routines.put(newRoutine);
    });
  }
}
