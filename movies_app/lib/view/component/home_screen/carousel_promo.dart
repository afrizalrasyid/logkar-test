import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselPromo extends StatelessWidget {
  const CarouselPromo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> promoCarouselList = [
      'assets/images/home/img_carousel_promo_1.jpg',
      'assets/images/home/img_carousel_promo_2.jpg',
      'assets/images/home/img_carousel_promo_3.jpg',
      'assets/images/home/img_carousel_promo_4.jpg',
    ];

    final List<Widget> imageSliders = promoCarouselList
        .map(
          (item) => Container(
            child: ClipRRect(
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000.0,
                    height: 500,
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();

    return CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(
        aspectRatio: 5.0,
        height: 150,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
      ),
    );
  }
}
