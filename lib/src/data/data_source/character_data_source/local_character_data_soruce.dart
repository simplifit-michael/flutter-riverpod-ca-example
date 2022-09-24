import 'package:dartz/dartz.dart';
import 'package:ricknmorty/src/core/failure/data_failure.dart';
import 'package:ricknmorty/src/core/failure/failure_code.dart';
import 'package:ricknmorty/src/data/model/character_model.dart';

abstract class LocalCharacterDataSource {
  Either<DataFailure, List<CharacterModel>> getCharacters();
  void updateCharacters(List<CharacterModel> newList);
}

class LocalCharacterDataSourceImpl extends LocalCharacterDataSource {
  final List<CharacterModel> _cache = [];

  @override
  Either<DataFailure, List<CharacterModel>> getCharacters() {
    if (_cache.isNotEmpty) {
      return Right([..._cache]);
    } else {
      return Left(DataFailure(FailureCode.localData0));
    }
  }

  @override
  void updateCharacters(List<CharacterModel> newList) {
    _cache.clear();
    _cache.addAll(newList);
  }
}
