
import 'package:oculus_reparo/domain/models/characters/Character.dart';

// this class helps to connect (to present) the view to the presenter and viceversa

abstract class HomeScreenContractView {
  showLoading();
  hideLoading();
  showError(String errorMessage);
  setCharacters(List<Character> characters);
}

abstract class HomeScreenContractPresenter {
  attachView(HomeScreenContractView view);
  detachView();
  getCharacters();
}