import 'package:flutter/material.dart';
import 'package:ricknmorty/src/domain/state/character.dart';


class DetailViewModel extends ChangeNotifier {
  DetailViewModel(this._current);
  final Character _current;

  String get name => _current.name;
  String get location => _current.location;
  String get origin => _current.origin;
  String get image => _current.image;
}
