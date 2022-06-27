
import 'package:floor/floor.dart';
import 'package:oculus_reparo/data/localdatabase/entities/CharacterEntity.dart';

@dao
abstract class CharacterDao {

  @Query('SELECT * FROM CharacterEntity')
  Future<List<CharacterEntity>?> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertRow(CharacterEntity characterEntity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertRows(List<CharacterEntity> characterEntities);

  @update
  Future<int> updateCharacter(CharacterEntity characterEntity);

  @Query('DELETE FROM CharacterEntity')
  Future<void> deleteAll();

}