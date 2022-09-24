import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricknmorty/src/core/provider/data_provider.dart';
import 'package:ricknmorty/src/data/repository/character_repository_impl.dart';
import 'package:ricknmorty/src/domain/repository/character_repository.dart';

final characterRepository = Provider<CharacterRepository>((ref) =>
    CharacterRepositoryImpl(ref.read(remoteCharacterDataSource),
        ref.read(localCharacterDataSource)));

