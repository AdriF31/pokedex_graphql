const baseUrl = 'https://beta.pokeapi.co/graphql/v1beta';

String pokemonList = """
 query getListPokemon(\$limit:Int!,\$offset:Int!) {
  pokemon_v2_pokemon (limit:\$limit,offset:\$offset){
    id
    name
    pokemon_v2_pokemontypes {
      pokemon_v2_type {
        name
      }
    }
  }
}
""";

String pokemonDetail = """
query getDetailPokemon(\$pokeId: Int!) {
 details: pokemon_v2_pokemon(where: {id: {_eq: \$pokeId}}) {
    id
    name
    height
    weight
    stats: pokemon_v2_pokemonstats {
      stat_name:pokemon_v2_stat {
        name
      }
      base_stat
    }
    types:pokemon_v2_pokemontypes {
      type:pokemon_v2_type {
        name
      }
    }
  }
  pokemon_species:pokemon_v2_pokemonspecies(where: {id: {_eq: \$pokeId}}) {
    description:pokemon_v2_pokemonspeciesflavortexts(where: {language_id: {_eq: 9}}, distinct_on: id) {
      id
      flavor_text
    }
  }
}


""";
