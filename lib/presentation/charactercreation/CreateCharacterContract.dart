
abstract class CreateCharacterViewContract{

}

abstract class CreateCharacterPresenterContract{
  attachView(CreateCharacterViewContract view);
  detachView();
}