part of 'shared.dart';

void saveToken(String token) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('token', token);
}

void removeToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.remove('token');
}

Future<String?> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.reload();
  return pref.getString('token');
}
