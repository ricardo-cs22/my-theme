import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:thema_seu_amigo/models/theme_model.dart';

import '../widgets/drawer_list.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/bd.jpg',
    'assets/images/carro.jpg',
    'assets/images/elden_ring.jpg',
    'assets/images/n22.jpg',
    'assets/images/na.jpg',
    'assets/images/samurai.jpg',
    'assets/images/t2.jpg',
    'assets/images/t3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeChanger.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.search, color: themeChanger.iconColor),
            Container(
              width: 170,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: themeChanger.textColor),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: themeChanger.textColor),
              ),
            ),
            Icon(Icons.settings, color: themeChanger.iconColor),
            IconButton(
              icon: Icon(Icons.share, color: themeChanger.iconColor),
              onPressed: themeChanger.shareThemeColors,
            ),
          ],
        ),
      ),
      body: Container(
        height: 1200,
        color: themeChanger.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              CarouselSlider(
                options: CarouselOptions(
                  height: 240.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enableInfiniteScroll: true,
                  viewportFraction: 0.8,
                ),
                items: imgList.map((path) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        path,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'WALLPAPER POPULAR',
                    style: TextStyle(
                      color: themeChanger.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://github.com/ricardo-cs22/my-theme/blob/main/lib/assets/images/elden_ring.jpg?raw=true',
                                fit: BoxFit.cover,
                                height: 250,
                                width: 160,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'WALLPAPER 1',
                            style: TextStyle(color: themeChanger.textColor),
                          ),
                          Text(
                            'Descrição Wallpaper',
                            style: TextStyle(color: Colors.grey),
                          ),
                          RatingBarIndicator(
                            rating: 4.0,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://github.com/ricardo-cs22/my-theme/blob/main/lib/assets/images/bd.jpg?raw=true',
                                fit: BoxFit.cover,
                                height: 250,
                                width: 160,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'WALLPAPER 2',
                            style: TextStyle(color: themeChanger.textColor),
                          ),
                          Text(
                            'Descrição Wallpaper',
                            style: TextStyle(color: Colors.grey),
                          ),
                          RatingBarIndicator(
                            rating: 3.5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeChanger.bottomNavBarColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: themeChanger.iconColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: themeChanger.iconColor),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: themeChanger.iconColor),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.amber,
        unselectedItemColor: themeChanger.iconColor,
      ),
      drawer: DrawerList(),
    );
  }
}
