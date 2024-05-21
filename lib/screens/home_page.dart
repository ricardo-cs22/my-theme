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
          'https://media.discordapp.net/attachments/1176930235019698359/1179147420844691476/Parque-Nacional-do-Pantanal-Matogrossense.jpg?ex=664cfb1c&is=664ba99c&hm=8a9dff3a2683952c244b5e0ebb1b79159b32e650563c1533f46e83e41b41d2f8&=&format=webp&width=701&height=468',
      'rating': 4.0
    },
    {
      'url':
          'https://discord.com/channels/1173024595536785408/1176930235019698359/1179147484732342392',
      'rating': 3.5
    },
    {
      'url':
          'https://media.discordapp.net/attachments/1176930235019698359/1179129509119807569/Imagem4.png?ex=664cea6e&is=664b98ee&hm=4f69f7e08b2effade650917cf048bb711e3bc37217ee2b316ff99b0cb968ef36&=&format=webp&quality=lossless&width=550&height=309',
      'rating': 5.0
    },
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
