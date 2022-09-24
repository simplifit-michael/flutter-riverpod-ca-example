import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricknmorty/src/core/provider/base_provider.dart';
import 'package:ricknmorty/src/data/data_source/character_data_source/local_character_data_soruce.dart';
import 'package:ricknmorty/src/data/data_source/character_data_source/remote_character_data_soruce.dart';

final remoteCharacterDataSource = Provider<RemoteCharacterDataSource>(
    (ref) => RemoteCharacterDataSourceImpl(ref.read(characterDioProvider)));

final localCharacterDataSource =
    Provider<LocalCharacterDataSource>((ref) => LocalCharacterDataSourceImpl());
