

import 'package:oculus_reparo/domain/models/characters/Character.dart';
import 'package:oculus_reparo/domain/usecases/CharacterUseCases.dart';
import 'package:oculus_reparo/presentation/home/HomeScreenContract.dart';

class HomeScreenPresenter implements HomeScreenContractPresenter {

  late CharacterUseCases _characterUseCases;
  HomeScreenContractView? _view;

  HomeScreenPresenter(
    CharacterUseCases characterUseCases
  ){
    _characterUseCases = characterUseCases;
  }

  @override
  attachView(HomeScreenContractView view) {
    _view = view;
  }

  @override
  detachView() {
    _view = null;
  }

  @override
  getCharacters() async {

    _view?.showLoading();
    final charactersResult = await _characterUseCases.getCharacters();
    if(charactersResult.item1){
      if(_isViewAttached()){
        _view?.hideLoading();
        _view?.setCharacters(charactersResult.item2!);
      }
    }else{
      _view?.hideLoading();
      _view?.showError(charactersResult.item3);
    }
  }

  // private functions
  bool _isViewAttached() => _view != null;

  @override
  updateCharacter(Character character) async {
    final result = await _characterUseCases.updateCharacter(character);
    if(_isViewAttached()){
      if(result){
        _view?.notifyImageSavedSuccessfully();
      }else{
        _view?.notifyImageNotSaved();
      }
    }

  }

}