import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ricknmorty/src/core/failure/data_failure.dart';
import 'package:ricknmorty/src/data/model/character_model.dart';
import 'package:ricknmorty/src/data/model/get_characters_model.dart';

abstract class RemoteCharacterDataSource {
  Future<Either<DataFailure, List<CharacterModel>>> getCharacters();
}

class RemoteCharacterDataSourceImpl extends RemoteCharacterDataSource {
  final Dio _dio;

  RemoteCharacterDataSourceImpl(this._dio);

  @override
  Future<Either<DataFailure, List<CharacterModel>>> getCharacters() async {
    try {
      final resp = await _dio.get('/character/');
      final data = GetCharactersModel.fromJson(resp.data);
      return Right(data.results);
    } catch (e) {
      return Left(DataFailure.build(e as Exception));
    }
  }
}
