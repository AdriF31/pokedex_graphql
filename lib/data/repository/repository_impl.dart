import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:pokedex/const/app_constant.dart';
import 'package:pokedex/data/model/pokemon_all_model.dart';
import 'package:pokedex/data/model/pokemon_description_model.dart';
import 'package:pokedex/data/model/pokemon_detail_model.dart';
import 'package:pokedex/data/network_core.dart';
import 'package:pokedex/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  HasuraConnect hasuraConnect = HasuraConnect(baseUrl);

  @override
  FutureOr<PokemonAllModel?> getAllPokemon(int offset, int limit) async {
    try {
      var res = await hasuraConnect
          .query(pokemonList, variables: {"limit": limit, "offset": offset});
      // print(res);
      return PokemonAllModel.fromJson(res);
    } on Exception catch (e) {
      return null;
    }
  }

  @override
  FutureOr<PokemonDetailModel?> getPokemonDetail(int id) async {
    try {
      var res = await hasuraConnect.query(pokemonDetail, variables: {
        "pokeId": id,
      });
      // print(res);

      return PokemonDetailModel.fromJson(res);
    } on Exception catch (e) {
      return null;
    }
  }
}
