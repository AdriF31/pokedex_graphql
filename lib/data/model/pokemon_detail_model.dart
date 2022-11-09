
class PokemonDetailModel {
  Data? data;

  PokemonDetailModel({this.data});

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
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
  List<Details>? details;
  List<PokemonSpecies>? pokemonSpecies;

  Data({this.details, this.pokemonSpecies});

  Data.fromJson(Map<String, dynamic> json) {
    details = json["details"] == null ? null : (json["details"] as List).map((e) => Details.fromJson(e)).toList();
    pokemonSpecies = json["pokemon_species"] == null ? null : (json["pokemon_species"] as List).map((e) => PokemonSpecies.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(details != null) {
      _data["details"] = details?.map((e) => e.toJson()).toList();
    }
    if(pokemonSpecies != null) {
      _data["pokemon_species"] = pokemonSpecies?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class PokemonSpecies {
  List<Description>? description;

  PokemonSpecies({this.description});

  PokemonSpecies.fromJson(Map<String, dynamic> json) {
    description = json["description"] == null ? null : (json["description"] as List).map((e) => Description.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(description != null) {
      _data["description"] = description?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Description {
  int? id;
  String? flavorText;

  Description({this.id, this.flavorText});

  Description.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    flavorText = json["flavor_text"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["flavor_text"] = flavorText;
    return _data;
  }
}

class Details {
  int? id;
  String? name;
  int? height;
  int? weight;
  List<Stats>? stats;
  List<Types>? types;

  Details({this.id, this.name, this.height, this.weight, this.stats, this.types});

  Details.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    height = json["height"];
    weight = json["weight"];
    stats = json["stats"] == null ? null : (json["stats"] as List).map((e) => Stats.fromJson(e)).toList();
    types = json["types"] == null ? null : (json["types"] as List).map((e) => Types.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["height"] = height;
    _data["weight"] = weight;
    if(stats != null) {
      _data["stats"] = stats?.map((e) => e.toJson()).toList();
    }
    if(types != null) {
      _data["types"] = types?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Types {
  Type? type;

  Types({this.type});

  Types.fromJson(Map<String, dynamic> json) {
    type = json["type"] == null ? null : Type.fromJson(json["type"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(type != null) {
      _data["type"] = type?.toJson();
    }
    return _data;
  }
}

class Type {
  String? name;

  Type({this.name});

  Type.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    return _data;
  }
}

class Stats {
  StatName? statName;
  int? baseStat;

  Stats({this.statName, this.baseStat});

  Stats.fromJson(Map<String, dynamic> json) {
    statName = json["stat_name"] == null ? null : StatName.fromJson(json["stat_name"]);
    baseStat = json["base_stat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(statName != null) {
      _data["stat_name"] = statName?.toJson();
    }
    _data["base_stat"] = baseStat;
    return _data;
  }
}

class StatName {
  String? name;

  StatName({this.name});

  StatName.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    return _data;
  }
}