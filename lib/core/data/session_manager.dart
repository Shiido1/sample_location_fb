// import 'package:shared_preferences/shared_preferences.dart';

// class SessionManager {
//   SessionManager._internal();

//   SharedPreferences? sharedPreferences;

//   static final SessionManager _instance = SessionManager._internal();

//   factory SessionManager() => _instance;

//   static SessionManager get instance => _instance;

//   Future<void> initializeSession() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

//   static const String keyAuthToken = 'auth_token';
//   static const String keyUserData = 'users_data';

//   String get authToken => sharedPreferences!.getString(keyAuthToken) ?? '';
//   String get usersData => sharedPreferences!.getString(keyUserData) ?? '';

//   set authToken(String authToken) =>
//       sharedPreferences!.setString(keyAuthToken, authToken);

//   set usersData(String usersData) =>
//       sharedPreferences!.setString(keyUserData, usersData);

//   // Map<String, dynamic> get usersData =>
//   //     json.decode(sharedPreferences!.getString(keyUserData) ?? '');

//   // set usersData(Map<String, dynamic> map) =>
//   //     sharedPreferences!.setString(keyUserData, json.encode(map));

//   Future<bool> logOut() async {
//     await sharedPreferences!.clear();
//     // try {
//     //   final cacheDir = await getTemporaryDirectory();
//     //   if (cacheDir.existsSync()) {
//     //     cacheDir.deleteSync(recursive: true);
//     //   }
//     //   final appDir = await getApplicationSupportDirectory();
//     //   if (appDir.existsSync()) {
//     //     appDir.deleteSync(recursive: true);
//     //   }
//     // } catch (e) {
//     //   logger.d("error clearing cache");
//     // }
//     return true;
//   }
// }
