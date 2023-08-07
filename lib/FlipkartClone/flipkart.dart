import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Flipkart extends StatefulWidget {
  const Flipkart({super.key});

  @override
  State<Flipkart> createState() => _FlipkartState();
}

class _FlipkartState extends State<Flipkart> {
  int _selectedIndex = 0;
  bool brandSwitch = true;
  List iconImages = [
    'images/Flipkart/HomeScreen/IconCategories/icon1.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon2.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon3.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon4.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon5.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon6.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon7.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon8.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon9.png.webp',
    'images/Flipkart/HomeScreen/IconCategories/icon10.png.webp',
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> products = List.generate(
      20,
          (index) => {
        'id': index,
        'name': 'product $index',
        'price': Random().nextInt(100),
      },
    ).toList();

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                Image.network(
                                    'https://cavinkare.com/img/2021/12/Flipkart-Logo-removebg-preview-1536x1536.png'),
                                Text(
                                  'Flipkart',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                Image.network(
                                    'https://cavinkare.com/img/2021/12/Flipkart-Logo-removebg-preview-1536x1536.png'),
                                Text(
                                  'Grocery',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Brand Mall',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                value: brandSwitch,
                                onChanged: (bool value) {
                                  setState(() {
                                    brandSwitch = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.all(15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Search for products",
                                fillColor: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ImageSlideshow(
                      width: double.infinity,
                      height: 150,
                      initialPage: 0,
                      indicatorColor: Colors.cyan,
                      indicatorBackgroundColor: Colors.grey,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: [
                        Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                              'images/Flipkart/HomeScreen/ImageViewer/add 1.png.webp'),
                        ),
                        Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                              'images/Flipkart/HomeScreen/ImageViewer/add2.jpg.webp'),
                        ),
                        Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                              'images/Flipkart/HomeScreen/ImageViewer/add3.png.webp'),
                        ),
                        Image(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                              'images/Flipkart/HomeScreen/ImageViewer/add4.jpg.webp'),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: iconImages
                              .map(
                                (item) => Padding(
                              padding: const EdgeInsets.all(5),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(item),
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: products.map((product) {
                          return GridTile(
                            footer: Container(
                              height: 50,
                              child: GridTileBar(
                                backgroundColor: Colors.black,
                                title: Text(product['name']),
                                subtitle:
                                Text("\$${product['price'].toString()}"),
                                trailing: const Icon(Icons.shopping_cart),
                              ),
                            ),
                            child: Image.asset('images/img1.jpg',
                                fit: BoxFit.cover),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.lightBlueAccent,
          unselectedItemColor: Colors.black,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          iconSize: 20,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize_outlined),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}