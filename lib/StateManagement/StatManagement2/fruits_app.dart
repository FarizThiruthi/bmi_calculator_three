import 'package:bmi_calculator_three/Provider/provider_class_fruit_app.dart';
import 'package:bmi_calculator_three/model/stMangmtFruits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fruit_app_result.dart';

class FruitStore extends StatefulWidget {
  const FruitStore({Key? key}) : super(key: key);

  @override
  State<FruitStore> createState() => _FruitStoreState();
}

class _FruitStoreState extends State<FruitStore> {
  @override
  Widget build(BuildContext context) {
    final cartObject = Provider.of<ProviderFruitApp>(context);
    List<FruitsCart> fruitProducts = [
      FruitsCart(title: 'Apple', price: '\$20', image: 'images/fruit_app/apple.png'),
      FruitsCart(title: 'Orange', price: '\$15',image: 'images/fruit_app/orange.webp'),
      FruitsCart(title: 'Kiwi', price: '\$25',image: 'images/fruit_app/kiwi.webp'),
      FruitsCart(title: 'Dragon Fruit', price: '\$11',image: 'images/fruit_app/dragon.webp'),
      FruitsCart(title: 'Mango', price: '\$18',image: 'images/fruit_app/mango.png'),
      FruitsCart(title: 'Tomato', price: '\$19',image: 'images/fruit_app/tomato.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.menu),
        title: Text('Fruits'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FruitStoreResult()),
                  );
                },
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              Positioned(
                right: 5,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.black,
                  child: Text(
                    cartObject.cartItemCount.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: fruitProducts.length,
              itemBuilder: (context, index) => Card(
                color: Colors.lightGreen,
                child: ListTile(
                  leading: Image(
                    height: 60,
                    width: 80,
                    fit: BoxFit.contain,
                      image: AssetImage(fruitProducts[index].image),
                  ),
                  title: Text(
                    ('${fruitProducts[index].title} / kg'),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    'Price : ${fruitProducts[index].price}',
                    textAlign: TextAlign.center,
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      cartObject.cart(fruitProducts[index]);
                    },
                    child: Text('Add to cart'),
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}