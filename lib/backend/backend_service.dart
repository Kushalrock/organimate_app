import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BackendService {
  static Map<String, String> getAuthHeaders(
      {token = "aRTfirBdSgSdSz0PCFvAiSoRKcmrwz58"}) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  predictCrop(
      {int N = 80,
      int P = 48,
      int K = 48,
      int temperature = 28,
      int humidity = 30,
      int ph = 8,
      int rainfall = 160,
      String label = "rice"}) async {
    var listOfCrops = [
      "jute",
      "pigeonpeas",
      "coconut",
      "apple",
      "mungbean",
      "watermelon",
      "kidneybeans",
      "rice",
      "papaya",
      "cotton",
      "pomegranate",
      "lentil",
      "blackgram",
      "mothbeans",
      "orange",
      "maize",
      "grapes",
      "coffee",
      "mango",
      "chickpea",
      "muskmelon",
      "banana"
    ];
    var urlString =
        "http://60374505-f6b4-43ce-8580-8bb3e2087381.eastus2.azurecontainer.io/score";
    var url = Uri.parse(urlString);

    //Simulating the real model
    var body = jsonEncode({
      "Inputs": {
        "data": [
          {
            "N": (N + Random().nextInt(70)).abs(),
            "P": (P + Random().nextInt(70)).abs(),
            "K": (K + Random().nextInt(70)).abs(),
            "temperature": (Random().nextInt(40) + 5).abs(),
            "humidity": Random().nextInt(90) + 10,
            "ph": (Random().nextInt(4) + 4).abs(),
            "rainfall": Random().nextInt(270) + 20,
          }
        ]
      },
      "GlobalParameters": {"method": "predict"}
    });

    var body1 = jsonEncode({
      "Inputs": {
        "data": [
          {
            "N": (N + Random().nextInt(70)).abs(),
            "P": (P + Random().nextInt(70)).abs(),
            "K": (K + Random().nextInt(70)).abs(),
            "temperature": (Random().nextInt(40) + 5).abs(),
            "humidity": Random().nextInt(90) + 10,
            "ph": (Random().nextInt(4) + 4).abs(),
            "rainfall": Random().nextInt(270) + 20,
          }
        ]
      },
      "GlobalParameters": {"method": "predict"}
    });

    var body2 = jsonEncode({
      "Inputs": {
        "data": [
          {
            "N": (N + Random().nextInt(70)).abs(),
            "P": (P + Random().nextInt(70)).abs(),
            "K": (K + Random().nextInt(70)).abs(),
            "temperature": (Random().nextInt(40) + 5).abs(),
            "humidity": Random().nextInt(90) + 10,
            "ph": (Random().nextInt(4) + 4).abs(),
            "rainfall": Random().nextInt(270) + 20,
          }
        ]
      },
      "GlobalParameters": {"method": "predict"}
    });

    final response = await http.post(url,
        headers: BackendService.getAuthHeaders(), body: body);

    final response2 = await http.post(url,
        headers: BackendService.getAuthHeaders(), body: body1);

    final response3 = await http.post(url,
        headers: BackendService.getAuthHeaders(), body: body2);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var actualData = jsonResponse['Results'][0];

      var jsonResponse1 = json.decode(response2.body);
      var actualData1 = jsonResponse1['Results'][0];

      var jsonResponse2 = json.decode(response3.body);
      var actualData2 = jsonResponse2['Results'][0];

      // var prob = [];
      // for (var crop in listOfCrops) {
      //   prob.add([
      //     "${crop.capitalizeFirst}",
      //     actualData['Scored Probabilities_$crop']
      //   ]);
      // }

      // var largest = prob[0];
      // var secondLargest = prob[1];
      // var thirdLargest = prob[2];
      // for (var perProb in prob) {
      //   if (perProb[1] > largest[1]) {
      //     largest = perProb;
      //   }
      // }

      // prob.remove(largest);

      // for (var perProb in prob) {
      //   if (perProb[1] > largest[1]) {
      //     secondLargest = perProb;
      //   }
      // }

      // prob.remove(secondLargest);

      // for (var perProb in prob) {
      //   if (perProb[1] > largest[1]) {
      //     thirdLargest = perProb;
      //   }
      // }

      // prob.remove(thirdLargest);

      return [
        [actualData, Random().nextInt(10) + 80],
        [actualData1, Random().nextInt(10) + 70],
        [actualData2, Random().nextInt(10) + 60]
      ];
    }
  }

  static sendOTP(String name, String number,
      {String companyName = "Organimate"}) async {
    Map<String, String> dataToSend = {
      "mobile_num": "+91$number",
      "person_name": name,
      "company_name": companyName
    };

    var urlString = "http://192.46.211.44/otp/send";
    var url = Uri.parse(urlString);
    final response = await http.post(url, body: dataToSend);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static verifyOTP(
    String otp,
    String number,
  ) async {
    Map<String, String> dataToSend = {"mobile_num": "+91$number", "otp": otp};

    var urlString = "http://192.46.211.44/otp/verify";
    var url = Uri.parse(urlString);
    final response = await http.post(url, body: dataToSend);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
