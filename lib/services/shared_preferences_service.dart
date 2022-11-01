import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _sharedPreferenceService;
  late final SharedPreferences _sharedPreferences;
  final String _userSelectedDarkTheme = 'UserSelectedDarkTheme';

  SharedPreferencesService._();

  static SharedPreferencesService get instance {
    if (_sharedPreferenceService == null) {
      throw Exception('SharedPreferencesService is not initialized, make sure to call ensureInitialized before getting instance');
    }
    return _sharedPreferenceService!;
  }

  static Future<SharedPreferencesService> ensureInitialized() async {
    _sharedPreferenceService ??= SharedPreferencesService._();

    await SharedPreferencesService.instance._initializeSharedPreferences();

    return SharedPreferencesService.instance;
  }

  Future<void> _initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool didUserSelectDarkTheme() => _sharedPreferences.getBool(_userSelectedDarkTheme) ?? false;
  void setUserSelectedDarkTheme(bool selectedDarkTheme) => _sharedPreferences.setBool(_userSelectedDarkTheme, selectedDarkTheme);
}
