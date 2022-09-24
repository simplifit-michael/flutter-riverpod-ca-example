import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ricknmorty/src/core/service/dio_factory.dart';

final characterDioProvider =
    Provider((ref) => DioFactory().build('https://rickandmortyapi.com/api'));
