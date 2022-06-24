

import 'package:oculus_reparo/base/utilities/ApiConstants.dart';
import 'package:oculus_reparo/data/api/ApiClient.dart';
import 'package:oculus_reparo/domain/datasources/CharacterDataSource.dart';
import 'package:oculus_reparo/domain/models/api/GetCharacterResponse.dart';
import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:tuple/tuple.dart';

class CharacterApiDataSourceImpl implements CharacterApiDataSource{

  final ApiClient _apiClient;

  CharacterApiDataSourceImpl(this._apiClient);

  @override
  Future<Tuple3<bool, List<Character>?, String>> getCharacters() async {

    // asking the apiClient to start the get Character call
    Tuple3<bool, GetCharacterResponse?, String> getCharacterResponseTuple = await _apiClient.getCharacters();

    try{
      if(getCharacterResponseTuple.item1){ // checking if the response was successful
        return Tuple3(true, getCharacterResponseTuple.item2!.characters, "");
      }else{
        return Tuple3(false, null, getCharacterResponseTuple.item3); // returning the error the error from the apiClient
      }
    }catch(error){
      return const Tuple3(false, null, ApiConstants.GET_CHARACTERS_FAILED_IN_DATA_SOURCE); // returning the error when it fails here
    }

  }

}