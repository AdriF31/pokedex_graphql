import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/base/base_controller.dart';
import 'package:pokedex/data/model/pokemon_detail_model.dart';
import 'package:pokedex/data/repository/repository.dart';

class DetailController extends BaseController {
  var isFavorite = false.obs;
  NumberFormat formatter = NumberFormat("#000");
  PokemonDetailModel? pokemonDetail = PokemonDetailModel();
  List<String?> pokemonDescription = [];
  Set<String?> filter = {};
  dynamic argumentData = Get.arguments;
  GetStorage box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    _getPokemonDetail(argumentData['id']);

    update();
  }

  Future _getPokemonDetail(int id) async {
    try {
      var res = await repository.getPokemonDetail(id);

      pokemonDetail = res;

      // for (int index = 0;
      //     index <=
      //         pokemonDetail!.data!.pokemonSpecies!.first.description!.length;
      //     index++) {
      //   pokemonDescription.add(pokemonDetail
      //       ?.data?.pokemonSpecies?.first.description?[index].flavorText);
      // }
      // print(pokemonDescription);
      // filter = pokemonDescription.toSet();
      // pokemonDescription = filter.toList();

      update();
    } catch (e) {
      update();
      return null;
    }
  }

  void simpanPokemon(int id, String name) {
    if (isFavorite.isTrue) {
      box.write('favorite', {"id": id, "name": name});
    } else {
      box.remove('favorite');
    }
  }
}
