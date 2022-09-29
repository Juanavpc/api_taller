import 'package:flutter/material.dart';
import 'package:taller_reto/Pages/Home_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemons',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MyHomeApp(title: 'Pokemons')
      },
    );
  }
}