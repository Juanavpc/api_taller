import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../Models/Model_images.dart';

class ImagenProvider {

  final url = "https://pokeapi.co/api/v2/pokemon?offset=8&limit=10";

  Future<List<ModelImages>> getPokemon() async {
    final resp = await http.get(Uri.parse(url));
    
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);
      final pokemons = PokemonDatos();
      
      for (var item in jsonData["results"]){
        final consul = item["url"];
        final pokemonData = await http.get(Uri.parse(consul));
        body = utf8.decode(pokemonData.bodyBytes);
        final jsonPokemonData = jsonDecode(body);
        pokemons.setItems(jsonPokemonData);
      
      }
      return pokemons.items;
    }else {
      throw Exception("Ocurrió algo ${resp.statusCode}");
    }
  }
}