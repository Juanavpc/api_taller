import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../Widgets/listImages.dart';
import '../Widgets/listSwiper.dart';
import '../Provider/Provider_images.dart';
import '../Models/Model_images.dart';

class MyHomeApp extends StatefulWidget{
  
  const MyHomeApp({Key? key, required this.title}):super(key: key);

  final String title;
  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp>{

  late Future<List<ModelImages>> pokemonList;

  @override
  void initState() {
    super.initState();
    final getprovider = ImagenProvider();
    pokemonList = getprovider.getPokemon();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: pokemonList,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child:PageView(
                    controller: PageController(
                      viewportFraction: 0.5
                    ),
                    children: listImages(snapshot.data as List<ModelImages>),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 200,
                  child: listSwiper(snapshot.data as List<ModelImages>),
                ),
              ],
            );
          }else{
            print(snapshot.error);
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}