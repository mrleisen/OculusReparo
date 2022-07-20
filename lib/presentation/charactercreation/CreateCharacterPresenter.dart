
import 'package:oculus_reparo/domain/usecases/CharacterUseCases.dart';
import 'package:oculus_reparo/presentation/charactercreation/CreateCharacterContract.dart';

class CreateCharacterPresenter implements CreateCharacterPresenterContract {

  late CharacterUseCases _characterUseCases;
  CreateCharacterViewContract? _view;

  CreateCharacterPresenter(
      CharacterUseCases characterUseCases
  ){
    _characterUseCases = characterUseCases;
  }

  @override
  attachView(CreateCharacterViewContract view) {
    _view = view;
  }

  @override
  detachView() {
    _view = null;
  }

  // private functions
  bool _isViewAttached() => _view != null;

}