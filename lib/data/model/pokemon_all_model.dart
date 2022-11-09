
class PokemonAllModel {
  Data? data;

  PokemonAllModel({this.data});

  PokemonAllModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<PokemonV2Pokemon>? pokemonV2Pokemon;

  Data({this.pokemonV2Pokemon});

  Data.fromJson(Map<String, dynamic> json) {
    pokemonV2Pokemon = json["pokemon_v2_pokemon"] == null ? null : (json["pokemon_v2_pokemon"] as List).map((e) => PokemonV2Pokemon.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(pokemonV2Pokemon != null) {
      _data["pokemon_v2_pokemon"] = pokemonV2Pokemon?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class PokemonV2Pokemon {
  int? id;
  String? name;
  List<PokemonV2Pokemontypes>? pokemonV2Pokemontypes;

  PokemonV2Pokemon({this.id, this.name, this.pokemonV2Pokemontypes});

  PokemonV2Pokemon.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    pokemonV2Pokemontypes = json["pokemon_v2_pokemontypes"] == null ? null : (json["pokemon_v2_pokemontypes"] as List).map((e) => PokemonV2Pokemontypes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if(pokemonV2Pokemontypes != null) {
      _data["pokemon_v2_pokemontypes"] = pokemonV2Pokemontypes?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class PokemonV2Pokemontypes {
  PokemonV2Type? pokemonV2Type;

  PokemonV2Pokemontypes({this.pokemonV2Type});

  PokemonV2Pokemontypes.fromJson(Map<String, dynamic> json) {
    pokemonV2Type = json["pokemon_v2_type"] == null ? null : PokemonV2Type.fromJson(json["pokemon_v2_type"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(pokemonV2Type != null) {
      _data["pokemon_v2_type"] = pokemonV2Type?.toJson();
    }
    return _data;
  }
}

class PokemonV2Type {
  String? name;

  PokemonV2Type({this.name});

  PokemonV2Type.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    return _data;
  }
}