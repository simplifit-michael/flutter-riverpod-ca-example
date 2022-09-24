import 'package:ricknmorty/src/domain/state/character.dart';

class CharacterModel implements CharacterEntityBuilder {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterModelOrigin origin;
  final CharacterModelLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  CharacterModel.fromJson(dynamic json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        type = json['type'],
        gender = json['gender'],
        origin = CharacterModelOrigin.fromJson(json['origin']),
        location = CharacterModelLocation.fromJson(json['location']),
        image = json['image'],
        episode = (json['episode'] as List<dynamic>)
            .map((e) => e.toString())
            .toList(),
        url = json['url'],
        created = DateTime.parse(json['created']);

  @override
  Character toDomain() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin.name,
      location: location.name,
      image: image,
    );
  }
}

class CharacterModelOrigin {
  final String name;
  final String url;
  CharacterModelOrigin.fromJson(dynamic json)
      : name = json['name'],
        url = json['url'];
}

class CharacterModelLocation {
  final String name;
  final String url;
  CharacterModelLocation.fromJson(dynamic json)
      : name = json['name'],
        url = json['url'];
}
