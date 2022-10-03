import 'dart:convert';

class PokemonDatos{
  List<ModelImages> items = [];

  PokemonDatos();

  setItems(Map<String, dynamic> json){
    if(json == null)return;
      final imagen = ModelImages.fromJsonMap(json);
      items.add(imagen);
  }
}

class ModelImages{
  late String name;
  late String url;

  ModelImages(this.name, this.url);
  ModelImages.fromJsonMap(Map<String, dynamic> json){
    name = json["name"];
    url = json["sprites"]["other"]["official-artwork"]["front_default"];
  }
}