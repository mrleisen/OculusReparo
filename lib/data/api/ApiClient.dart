
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:oculus_reparo/base/utilities/ApiConstants.dart';
import 'package:oculus_reparo/domain/models/api/GetCharacterResponse.dart';
import 'package:tuple/tuple.dart';

class ApiClient {

  // this method returns a future with a boolean that tells the successful request, a getUserResponse with the actual response of the api
  // and a string if the request fails
  Future<Tuple3<bool, GetCharacterResponse?, String>> getCharacters() async {

    // this is the url
    final URL = Uri.parse(ApiConstants.API_GET_CHARACTERS);

    // implementing a try catch in order to catch any error trying in the request and decoding the response
    try{
      final response = await http.get(
          URL,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
          }
      );

      if(response.statusCode == 200){ // status code 200 means the request was successful
        // converting the response to JSON first an then to a getUserResponse object
        GetCharacterResponse getCharacterResponse = GetCharacterResponse.fromJson(jsonDecode(response.body));
        return Tuple3(true, getCharacterResponse, "");
      }else{
        return Tuple3(false,  null, "${response.statusCode}"); // returning status code related to errors
      }
    }catch(error){
      print("error: $error");
      return const Tuple3(false,  null, ApiConstants.API_GET_CHARACTERS_FAILED);  // unknown error
    }

  }

}