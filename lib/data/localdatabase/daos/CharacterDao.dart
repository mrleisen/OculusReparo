
import 'package:floor/floor.dart';
import 'package:oculus_reparo/data/localdatabase/entities/CharacterEntity.dart';

@dao
abstract class CharacterDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertRow(CharacterEntity characterEntity);

  @update
  Future<int> updateCharacter(CharacterEntity characterEntity);

  @Query('DELETE FROM CharacterEntity')
  Future<void> deleteAll();

}