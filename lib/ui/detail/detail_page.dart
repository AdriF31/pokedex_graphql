import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/const/color.dart';
import 'package:pokedex/ui/detail/detail_controller.dart';
import 'package:pokedex/helper/extension_method.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (controller) {
          if (controller.state == DetailViewState.loading) {
            return Scaffold(
              backgroundColor: controller
                  .pokemonDetail?.data?.details?.first.types?.first.type?.name
                  ?.toPokemonTypeColor(),
              body: Container(
                alignment: Alignment.center,
                child: Center(
                    child: Lottie.asset('assets/images/pokeball_lottie.json',
                        width: 50)),
              ),
            );
          }
          return Scaffold(
              backgroundColor: controller
                      .pokemonDetail!.data!.details!.first.types!.isNotEmpty
                  ? controller.pokemonDetail?.data?.details?.first.types?.first
                      .type?.name
                      ?.toPokemonTypeColor()
                  : Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(controller.pokemonDetail?.data?.details?.first.name
                        ?.capitalizeFirst ??
                    '-'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Center(
                        child: Text(
                      '#${controller.formatter.format(controller.pokemonDetail?.data?.details?.first.id ?? 0)}',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                  )
                ],
              ),
              body: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/icons/ic_pokeball.svg',
                      height: 250,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    bottom: Get.size.height * 0.1,
                    right: 0,
                    left: 0,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(20),
                      width: Get.size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(() => GestureDetector(
                                    onTap: () {
                                      // controller.simpanPokemon(
                                      //     controller.pokemonDetail?.data?.details?.first.id ?? 0,
                                      //     controller.pokemonDetail?.name ??
                                      //         '');
                                    },
                                    child: Icon(
                                      controller.isFavorite.isFalse
                                          ? Icons.favorite_outline
                                          : Icons.favorite,
                                      color: Colors.red,
                                      size: 34,
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.pokemonDetail!.data!.details!
                                        .first.types!.isNotEmpty &&
                                    controller.pokemonDetail != null
                                ? controller
                                    .pokemonDetail!.data!.details!.first.types!
                                    .map((e) => Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                              color: e.type?.name
                                                      ?.toPokemonTypeColor() ??
                                                  grass,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            e.type?.name?.capitalizeFirst ?? '',
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ))
                                    .toList()
                                : [],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'About',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: controller.pokemonDetail?.data?.details
                                        ?.first.types?.first.type?.name
                                        ?.toPokemonTypeColor() ??
                                    grass),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.black87),
                                      children: [
                                        WidgetSpan(
                                            child: SvgPicture.asset(
                                          "assets/icons/ic_weight.svg",
                                          color: Colors.black87,
                                          width: 20,
                                        )),
                                        TextSpan(
                                            text:
                                                '   ${(controller.pokemonDetail?.data?.details?.first.weight ?? 0) / 10} Kg',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14)),
                                        TextSpan(
                                            text: '\n\nWeight',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14))
                                      ])),
                              const SizedBox(
                                height: 70,
                                child: VerticalDivider(
                                  width: 40,
                                  thickness: 1,
                                  color: Colors.black26,
                                ),
                              ),
                              RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.black87),
                                      children: [
                                        WidgetSpan(
                                            child: SvgPicture.asset(
                                          "assets/icons/ic_height.svg",
                                          color: Colors.black87,
                                          width: 10,
                                        )),
                                        TextSpan(
                                            text:
                                                '   ${(controller.pokemonDetail?.data?.details?.first.height ?? 0) / 10} m',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14)),
                                        TextSpan(
                                            text: '\n\nHeight',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14))
                                      ])),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            '${controller.pokemonDetail?.data?.pokemonSpecies?.first.description?[0].flavorText?.getPokemonDescription() ?? '-'}  ${controller.pokemonDetail?.data?.pokemonSpecies?.first.description?[3].flavorText?.getPokemonDescription() ?? '-'} ${controller.pokemonDetail?.data?.pokemonSpecies?.first.description?[4].flavorText?.getPokemonDescription() ?? '-'}',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Base Stats',
                            style: GoogleFonts.poppins(
                                fontSize: Get.textScaleFactor * 20,
                                fontWeight: FontWeight.bold,
                                color: controller.pokemonDetail?.data?.details
                                        ?.first.types?.first.type?.name
                                        ?.toPokemonTypeColor() ??
                                    grass),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                              children: controller
                                      .pokemonDetail!.data!.details!.isNotEmpty
                                  ? controller.pokemonDetail!.data!.details!
                                      .first.stats!
                                      .map(
                                        (e) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.statName?.name
                                                            ?.getPokemonStat() ??
                                                        '',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(e.baseStat.toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 12)),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              flex: 5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: TweenAnimationBuilder<
                                                            double>(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    400),
                                                        curve: Curves.easeInOut,
                                                        tween: Tween<double>(
                                                          begin: 0,
                                                          end: (e.baseStat ??
                                                                  0) /
                                                              255,
                                                        ),
                                                        builder: (context,
                                                            value, _) {
                                                          return LinearProgressIndicator(
                                                              minHeight: 7,
                                                              backgroundColor: controller
                                                                  .pokemonDetail
                                                                  ?.data
                                                                  ?.details
                                                                  ?.first
                                                                  .types
                                                                  ?.first
                                                                  .type
                                                                  ?.name
                                                                  ?.toPokemonTypeColor()
                                                                  .withOpacity(
                                                                      0.3),
                                                              color: controller
                                                                  .pokemonDetail
                                                                  ?.data
                                                                  ?.details
                                                                  ?.first
                                                                  .types
                                                                  ?.first
                                                                  .type
                                                                  ?.name
                                                                  ?.toPokemonTypeColor(),
                                                              value: value);
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                      .toList()
                                  : []),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${controller.pokemonDetail?.data?.details?.first.id ?? 0}.png',
                          width: Get.size.width * 0.45,
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
