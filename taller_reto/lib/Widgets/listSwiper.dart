import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../Models/Model_images.dart';

Widget listSwiper(List<ModelImages> data){
  return Container(
    width: double.maxFinite,
    height: 320.0,
    child: Swiper(
      itemWidth: 200.0,
      itemCount: data.length,
      layout: SwiperLayout.STACK,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color.fromARGB(255, 224, 213, 181),
          child: Image.network(data[index].url),
        );
      }
    ),
  );
}