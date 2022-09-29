import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class MyHomeApp extends StatefulWidget{
  
  const MyHomeApp({Key? key, required this.title}):super(key: key);

  final String title;
  @override
  State<MyHomeApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child:PageView(
                controller: PageController(
                  viewportFraction: 0.5
                ),
                children: <Widget>[
                  Page(Colors.yellow, "Imagen 1"),
                  Page(Colors.red, "Imagen 2"),
                  Page(Colors.blue, "Imagen 3"),
                  Page(Colors.pink, "Imagen 4"),
                  Page(Colors.green, "Imagen 5"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 200,
              child: Swiper(
                itemWidth: 200,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index){
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://picsum.photos/id/237/200/300", fit: BoxFit.cover),
                  );
                },
                viewportFraction: 0.8,
                scale: 0.9,
                layout: SwiperLayout.STACK,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget{
  final color;
  final text;
  const Page(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(right: 20, top: 20),
      decoration: BoxDecoration(
        color: this.color,
      ),
      child: Text(
        this.text,
        textAlign: TextAlign.center,
      ),
    );
  }
}