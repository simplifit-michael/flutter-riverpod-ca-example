import 'package:ricknmorty/src/data/model/character_model.dart';

class GetCharactersModel {
  final GetCharactersInfoModel info;
  final List<CharacterModel> results;

  GetCharactersModel.fromJson(dynamic json)
      : info = GetCharactersInfoModel.fromJson(json['info']),
        results = (json['results'] as List<dynamic>)
            .map((c) => CharacterModel.fromJson(c))
            .toList();
}

class GetCharactersInfoModel {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  GetCharactersInfoModel.fromJson(dynamic json)
      : count = json['count'],
        pages = json['pages'],
        next = json['next'],
        prev = json['prev'];
}
