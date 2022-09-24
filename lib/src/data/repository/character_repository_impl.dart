import 'package:ricknmorty/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ricknmorty/src/data/data_source/character_data_source/remote_character_data_soruce.dart';
import 'package:ricknmorty/src/data/data_source/character_data_source/local_character_data_soruce.dart';
import 'package:ricknmorty/src/domain/state/character.dart';
import 'package:ricknmorty/src/domain/repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final RemoteCharacterDataSource _remote;
  final LocalCharacterDataSource _local;

  CharacterRepositoryImpl(this._remote, this._local);

  @override
  Future<Either<Failure, List<Character>>> getCharacters(
      {bool forceRefresh = false}) async {
    if (forceRefresh) {
      final result = await _remote.getCharacters();
      return result.fold(
        (l) => Left(l),
        (r) {
          _local.updateCharacters(r);
          return Right(r.map((c) => c.toDomain()).toList());
        },
      );
    } else {
      final result = _local.getCharacters();
      return result.fold(
        (l) async {
          final result = await _remote.getCharacters();
          return result.fold(
            (l) => Left(l),
            (r) {
              _local.updateCharacters(r);
              return Right(r.map((c) => c.toDomain()).toList());
            },
          );
        },
        (r) => Right(r.map((c) => c.toDomain()).toList()),
      );
    }
  }

  @override
  Character? getCharacterById(int id) {
    return _local.getCharacters().fold((l) => null, (r) {
      final list = r.where((element) => element.id == id);
      if (list.length == 1) {
        return list.single.toDomain();
      }
      return null;
    });
  }
}
