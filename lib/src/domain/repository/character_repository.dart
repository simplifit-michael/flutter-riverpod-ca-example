import 'package:dartz/dartz.dart';
import 'package:ricknmorty/src/core/failure/failure.dart';
import 'package:ricknmorty/src/domain/state/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getCharacters(
      {bool forceRefresh = false});

  Character? getCharacterById(int id);
}
