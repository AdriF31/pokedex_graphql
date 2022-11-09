import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/base/base_controller.dart';
import 'package:pokedex/data/model/pokemon_all_model.dart';

class PokemonController extends BaseController {
  NumberFormat formatter = NumberFormat("#000");

  static const limit = 9;

  final PagingController<int, PokemonV2Pokemon> pagingController =
      PagingController(firstPageKey: 0);

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await repository.getAllPokemon(pageKey, limit);

      final isLastPage = newItems!.data!.pokemonV2Pokemon!.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.data!.pokemonV2Pokemon!);
      } else {
        final nextPageKey = pageKey + newItems.data!.pokemonV2Pokemon!.length;
        pagingController.appendPage(newItems.data!.pokemonV2Pokemon!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
