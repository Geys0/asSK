import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:assk_connect/core/constants/app_constants.dart';

class AppConfig {
  static late SharedPreferences _prefs;
  static late Logger _logger;
  
  // Getters
  static SharedPreferences get prefs => _prefs;
  static Logger get logger => _logger;
  
  // Configuration values
  static bool get isDebugMode => const bool.fromEnvironment('DEBUG', defaultValue: true);
  static String get apiBaseUrl => const String.fromEnvironment('API_BASE_URL', defaultValue: AppConstants.baseUrl);
  static String get signalRUrl => '$apiBaseUrl${AppConstants.signalRHub}';
  
  /// Initialize app configuration
  static Future<void> initialize() async {
    // Initialize SharedPreferences
    _prefs = await SharedPreferences.getInstance();
    
    // Initialize Logger
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
      level: isDebugMode ? Level.debug : Level.info,
    );
    
    _logger.i('AppConfig initialized successfully');
  }
  
  /// Get stored value
  static T? getValue<T>(String key) {
    if (T == String) return _prefs.getString(key) as T?;
    if (T == int) return _prefs.getInt(key) as T?;
    if (T == double) return _prefs.getDouble(key) as T?;
    if (T == bool) return _prefs.getBool(key) as T?;
    if (T == List<String>) return _prefs.getStringList(key) as T?;
    return null;
  }
  
  /// Set stored value
  static Future<bool> setValue<T>(String key, T value) async {
    if (value is String) return await _prefs.setString(key, value);
    if (value is int) return await _prefs.setInt(key, value);
    if (value is double) return await _prefs.setDouble(key, value);
    if (value is bool) return await _prefs.setBool(key, value);
    if (value is List<String>) return await _prefs.setStringList(key, value);
    return false;
  }
  
  /// Remove stored value
  static Future<bool> removeValue(String key) async {
    return await _prefs.remove(key);
  }
  
  /// Clear all stored values
  static Future<bool> clearAll() async {
    return await _prefs.clear();
  }
}
