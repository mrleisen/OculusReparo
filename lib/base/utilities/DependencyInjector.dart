
import 'package:get_it/get_it.dart';
import 'package:oculus_reparo/data/api/ApiClient.dart';
import 'package:oculus_reparo/data/implementations/datasourcesimpl/CharacterApiDataSourceImpl.dart';
import 'package:oculus_reparo/data/implementations/repositoriesimpl/CharacterRepositoryImpl.dart';
import 'package:oculus_reparo/data/implementations/usecasesimpl/CharacterUseCasesImpl.dart';
import 'package:oculus_reparo/domain/datasources/CharacterDataSource.dart';
import 'package:oculus_reparo/domain/repositories/CharacterRepository.dart';
import 'package:oculus_reparo/domain/usecases/CharacterUseCases.dart';
import 'package:oculus_reparo/presentation/home/HomeScreenPresenter.dart';

final serviceLocator = GetIt.instance;

void init(){

  //lazy
  serviceLocator.registerLazySingleton<ApiClient>(() => ApiClient());

  //presenter
  serviceLocator.registerFactory(() => HomeScreenPresenter(serviceLocator()));

  // usecases
  serviceLocator.registerLazySingleton<CharacterUseCases>(() => CharacterUseCasesImpl(serviceLocator()));

  // repositories
  serviceLocator.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(serviceLocator()));

  // datasources
  serviceLocator.registerLazySingleton<CharacterApiDataSource>(() => CharacterApiDataSourceImpl(serviceLocator()));

}