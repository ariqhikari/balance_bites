part of 'services.dart';

class CalculatorServices {
  static Future<ApiReturnValue<CalorieCalculator>> calculateCalories({
    required String gender,
    required int age,
    required int height,
    required int weight,
  }) async {
    String? token = await getToken();

    http.Client client = http.Client();
    String url = '$baseURL/api/calculate-calories';

    var response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': token ?? '',
        },
        body: jsonEncode(<String, dynamic>{
          'gender': gender,
          'age': age,
          'height': height,
          'weight': weight,
        }));

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    var calculate = CalorieCalculator.fromJson(data['body']['data']);

    return ApiReturnValue(value: calculate);
  }

  static Future<ApiReturnValue<List<CalorieCalculator>>>
      getHistoryCalculations() async {
    String? token = await getToken();

    http.Client client = http.Client();
    String url = '$baseURL/api/get-history-calculations';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'token': token ?? '',
    });

    var data = jsonDecode(response.body);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: data['body']['message']);
    }

    List<CalorieCalculator> value = (data['body']['data'] as Iterable)
        .map((result) => CalorieCalculator.fromJson(result))
        .toList();

    return ApiReturnValue(value: value);
  }
}
