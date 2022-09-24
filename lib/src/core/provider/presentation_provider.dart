import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricknmorty/src/core/provider/domain_provider.dart';
import 'package:ricknmorty/src/domain/state/character.dart';
import 'package:ricknmorty/src/presentation/detail_view/detail_view_model.dart';

import '../../presentation/main_view/main_view_model.dart';

final mainScreenModel = ChangeNotifierProvider(
    (ref) => MainViewModel(ref.read(characterRepository)));

final detailScreenModel = ChangeNotifierProvider.family((ref, int id) {
  final repo = ref.read(characterRepository);
  final char = repo.getCharacterById(id);
  if (char != null) {
    return DetailViewModel(char);
  } else {
    return DetailViewModel(
      Character(
        id: id,
        name: '$id not found',
        status: '$id not found',
        species: '$id not found',
        type: '$id not found',
        gender: '$id not found',
        origin: '$id not found',
        location: '$id not found',
        image: '$id not found',
      ),
    );
  }
});
