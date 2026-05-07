import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> save(
    String? name,
    String? email,
    double? sallary,
    double? bankBalance,
    String? country,
  ) async {
    if (name != null) {
      await prefs!.setString('name', name);
    }

    if (email != null) {
      await prefs!.setString('email', email);
    }

    if (sallary != null) {
      await prefs!.setDouble('sallary', sallary);
    }

    if (bankBalance != null) {
      await prefs!.setDouble('bankBalance', bankBalance);
    }

    if (country != null) {
      await prefs!.setString('country', country);
    }
  }

  static String loudname() {
    final String? name = prefs!.getString('name');
    return name ?? '';
  }

  static String loudemail() {
    final String? email = prefs!.getString('email');
    return email ?? '';
  }

  static double loudsallary() {
    final double? sallary = prefs!.getDouble('sallary');
    return sallary ?? 0.0;
  }

  static double loudbankBalance() {
    final double? bankBalance = prefs!.getDouble('bankBalance');
    return bankBalance ?? 0.0;
  }

  static String loudcountry() {
    final String? country = prefs!.getString('country');
    return country ?? '';
  }
}
