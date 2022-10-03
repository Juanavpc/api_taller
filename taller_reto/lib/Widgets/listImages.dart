import 'package:flutter/material.dart';
import 'package:taller_reto/Models/Model_images.dart';

List<Widget> listImages(List<ModelImages> data){
  List<Widget> pokemones = [];
  for(var pokemon in data){
    pokemones.add(
      Card(
        child: Column(
          children: [
            Text(pokemon.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Image.network(pokemon.url, fit: BoxFit.fill,)
            )
          ],
        ),
        color: Color.fromARGB(255, 224, 213, 181),
      ),
    );
  }
  return pokemones;
}

