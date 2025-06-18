
import 'package:elite_team_training_app/models/address/district.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../models/address/city.dart';

class LocalStorageService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _languageKey = 'language_code';

  static Future<void> saveToken(String token) async {
    await _prefs?.setString(_tokenKey, token);
  }

  static String? getToken() {
    return _prefs?.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    await _prefs?.remove(_tokenKey);
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final jsonData = jsonEncode(userData);
    await _prefs?.setString(_userKey, jsonData);
  }

  static Map<String, dynamic>? getUserData() {
    final jsonString = _prefs?.getString(_userKey);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  static Future<void> clearUserData() async {
    await _prefs?.remove(_userKey);
  }

  static Future<void> saveLanguageCode(String code) async {
    await _prefs?.setString(_languageKey, code);
  }

  static String? getLanguageCode() {
    return _prefs?.getString(_languageKey);
  }

  static Future<void> clearAll() async {
    await _prefs?.clear();
  }

  static Future<void> saveCitiesToLocal(List<City> cities) async {

    final List<String> citiesJsonList =
    cities.map((city) => json.encode(city.toJson())).toList();
      await _prefs?.setStringList('cities', citiesJsonList);
  }

  static Future<List<City>> getCitiesFromLocal() async {

    final List<String>? citiesJsonList =  await _prefs?.getStringList('cities');

    if (citiesJsonList != null) {
      return citiesJsonList
          .map((cityJson) => City.fromJson(json.decode(cityJson)))
          .toList();
    } else {
      return [];
    }
  }

  static Future<void> saveDistrictToLocal(List<District> cities) async {

    final List<String> districtdsJsonList =
    cities.map((district) => json.encode(district.toJson())).toList();
    await _prefs?.setStringList('District', districtdsJsonList);
  }

  static Future<List<District>> getDistrictFromLocal() async {

    final List<String>? districtdsJsonList =  _prefs?.getStringList('District');

    if (districtdsJsonList != null) {
      return districtdsJsonList
          .map((cityJson) => District.fromJson(json.decode(cityJson)))
          .toList();
    } else {
      return [];
    }
  }
}
