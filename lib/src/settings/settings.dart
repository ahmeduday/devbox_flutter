import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? prefs;

  static String get textEditorTheme =>
      prefs?.getString("TextEditorTheme") ?? "monokai";
  static set textEditorTheme(String value) =>
      prefs?.setString("TextEditorTheme", value);

  static double get textEditorFontSize =>
      prefs?.getDouble("TextEditorFontSize") ?? 14.0;
  static set textEditorFontSize(double value) =>
      prefs?.setDouble("TextEditorFontSize", value);

  static String get textEditorFontFamily =>
      prefs?.getString("TextEditorFontFamily") ?? "FiraCode";
  static set textEditorFontFamily(String value) =>
      prefs?.setString("TextEditorFontFamily", value);

  static bool get textEditorWrap => prefs?.getBool("TextEditorWrap") ?? false;
  static set textEditorWrap(bool value) =>
      prefs?.setBool("TextEditorWrap", value);

  static bool get textEditorDisplayLineNumbers =>
      prefs?.getBool("TextEditorDisplayLineNumbers") ?? false;
  static set textEditorDisplayLineNumbers(bool value) =>
      prefs?.setBool("TextEditorDisplayLineNumbers", value);

  static int get decimalPlaces => prefs?.getInt("DecimalPlaces") ?? 2;
  static set decimalPlaces(int value) => prefs?.setInt("DecimalPlaces", value);

  static int get funcDecimalPlaces => prefs?.getInt("funcDecimalPlaces") ?? 2;
  static set funcDecimalPlaces(int value) =>
      prefs?.setInt("funcDecimalPlaces", value);

  static bool get isAdsDisabled => prefs?.getBool("IsAdsDisabled") ?? false;
  static set isAdsDisabled(bool value) =>
      prefs?.setBool("IsAdsDisabled", value);

  static bool get isTrackingEnabled =>
      prefs?.getBool("IsTrackingEnabled") ?? true;
  static set(bool value) => prefs?.setBool("IsTrackingEnabled", value);

  static String get displayMode => prefs?.getString("displayMode") ?? "system";
  static set displayMode(String value) =>
      prefs?.setString("displayMode", value);

  static String get appTheme => prefs?.getString("appTheme") ?? "defaultTheme";
  static set appTheme(String value) => prefs?.setString("appTheme", value);

  static bool get isTelemetryEnabled =>
      prefs?.getBool("IsTelemetryEnabled") ?? true;
  static set isTelemetryEnabled(bool value) =>
      prefs?.setBool("IsTelemetryEnabled", value);

  // static bool isTestAdd() =>
  //     ProgInfo.currentBuild == Build.omega ? false : true;

  static String? get appVersion {
    var res = prefs?.getString("appVersion");
    return res == null || res == "" ? null : res;
  }

  static set appVersion(String? value) =>
      prefs?.setString("appVersion", value ?? "");

  static bool get isFirstRun => prefs?.getBool("isFirstRun") ?? true;
  static set isFirstRun(bool value) => prefs?.setBool("isFirstRun", value);

  static Future<String> getString(String key, String defaultValue) async {
    var pre = await SharedPreferences.getInstance();
    return pre.getString(key) ?? defaultValue;
  }

  static Future<void> setString(String key, String value) async {
    var pre = await SharedPreferences.getInstance();
    pre.setString(key, value);
  }

  static Future<bool> getBool(String key, bool defaultValue) async {
    var pre = await SharedPreferences.getInstance();
    return pre.getBool(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    var pre = await SharedPreferences.getInstance();
    pre.setBool(key, value);
  }

  static Future<int> getInt(String key, int defaultValue) async {
    var pre = await SharedPreferences.getInstance();
    return pre.getInt(key) ?? defaultValue;
  }

  static Future<void> setInt(String key, int value) async {
    var pre = await SharedPreferences.getInstance();
    pre.setInt(key, value);
  }
}
