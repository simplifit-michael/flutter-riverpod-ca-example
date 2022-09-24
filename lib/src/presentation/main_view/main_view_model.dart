import 'package:flutter/material.dart';
import 'package:ricknmorty/src/domain/repository/character_repository.dart';
import 'package:ricknmorty/src/domain/state/character.dart';

class MainViewModel extends ChangeNotifier {
  final CharacterRepository _repo;

  MainViewModel(this._repo) {
    updateCharacters();
  }

  bool get isBusy => _isBusy;
  bool _isBusy = false;
  setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  final List<Character> _characters = [];
  List<Character> get characters => [..._characters];

  Future<void> updateCharacters() async {
    setBusy(true);
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      final newChars = await _repo.getCharacters();
      newChars.fold(
        (failure) => null,
        (newList) {
          _characters.clear();
          _characters.addAll(newList);
        },
      );
    } finally {
      setBusy(false);
    }
  }
}
