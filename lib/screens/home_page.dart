import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:thema_seu_amigo/models/theme_model.dart';

import '../widgets/drawer_list.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> imgList = [
    {
      'url':
          'https://cdn.discordapp.com/attachments/1176930235019698359/1179147484174487553/pantanal151.jpg?ex=664a582b&is=664906ab&hm=8eeea37d330ce170d59fc7592cf950a964445dd079eaa968ec7d712b2bf9dc42&',
      'rating': 4.0
    },
    {'url': 'https://via.placeholder.com/600/771796', 'rating': 3.5},
    {'url': 'https://via.placeholder.com/600/24f355', 'rating': 5.0},
    {'url': 'https://via.placeholder.com/600/d32776', 'rating': 4.5},
    {'url': 'https://via.placeholder.com/600/f66b97', 'rating': 4.0},
    {'url': 'https://via.placeholder.com/600/56a8c2', 'rating': 3.0},
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
              width: 200,
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
                items: imgList.map((item) {
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        item['url'],
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
                                'https://via.placeholder.com/200',
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
                                'https://via.placeholder.com/200',
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