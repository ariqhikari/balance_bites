part of 'services.dart';

class AuthServices {
  static Future<ApiReturnValue<bool>> signUp(
      String name, String email, String password) async {
    http.Client client = http.Client();
    String url = '$baseURL/api/auth/register';

    var response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    return ApiReturnValue(
        value: true, message: 'Successfully registered an account');
  }

  static Future<ApiReturnValue<User>> signIn(
      String email, String password) async {
    http.Client client = http.Client();
    String url = '$baseURL/api/auth/login';

    var response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    String token = data['body']['data']['token'];
    saveToken(token);

    User.token = token;
    User.id = data['body']['data']['user']['id'];
    User value = User.fromJson(data['body']['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> loadUser() async {
    String? token = await getToken();

    http.Client client = http.Client();
    String url = '$baseURL/api/auth/verify';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'token': token ?? '',
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    User.token = token;
    User.id = data['body']['data']['user']['id'];
    User value = User.fromJson(data['body']['data']['user']);

    return ApiReturnValue(value: value);
  }

  static void signOut() async {
    removeToken();
  }
}
