import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:libuta_sugbo_app/models/user_model.dart';

class HttpHelper {

  final UserBox _userBox = UserBox();
  
  Future<dynamic> postRequest(
      {required Uri url, required Object payload}) async {
      print('http post request:$url');
    
    try {
      

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      
      if (!_userBox.isEmpty) {
        headers.putIfAbsent(HttpHeaders.authorizationHeader,
            () => 'Bearer ${_userBox.userData.token}');
      }

      Response response =
          await post(url, body: jsonEncode(payload), headers: headers);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        return jsonData;
      } else {
        print(response.body);
        print(response.statusCode);
        return response.statusCode;
      }
    } catch (e) {
      print('http catch error:$e');
    }
  }

  Future<dynamic> httpGetRequest({required Uri url}) async {
    print('http get request:$url');
    print('_userBox.userData.token:${_userBox.userData.token}');


    try {
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json'
      };

      if (!_userBox.isEmpty) {
        headers.putIfAbsent(HttpHeaders.authorizationHeader,
            () => 'Bearer ${_userBox.userData.token}');
      }

      Response response = await get(url, headers: headers);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        return jsonData;
      } else {
        print(response.body);
        print(response.statusCode);
        return response.statusCode;
      }
    } catch (e) {
      print('http catch error:$e');
    }
  }

  Future<String> convertImageUrlToBase64(Uri url) async {
    Response response = await get(url);

    return base64Encode(response.bodyBytes);
  }
}
