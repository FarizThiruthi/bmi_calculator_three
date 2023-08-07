import 'package:bmi_calculator_three/Provider/provider_class_fruit_app.dart';
import 'package:bmi_calculator_three/model/stMangmtFruits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FruitStoreResult extends StatefulWidget {
  const FruitStoreResult({Key? key}) : super(key: key);

  @override
  State<FruitStoreResult> createState() => _FruitStoreState();
}

class _FruitStoreState extends State<FruitStoreResult> {
  @override
  Widget build(BuildContext context) {
    final cartObject = Provider.of<ProviderFruitApp>(context);
    List<FruitsCart> cartProduct = cartObject.cartProducts.toList();

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProduct.length,
              itemBuilder: (context, index) {
                final cartItemList = cartProduct.toList();
                final item = cartProduct.elementAt(index);
                if (cartItemList.indexWhere((c) => c.title == item.title) != index) {
                  return SizedBox.shrink(); // Return an empty SizedBox for duplicates
                }
                // Calculate the count of each item in the cart
                int itemCount = cartObject.cartItems.where((c) => c.title == item.title).length;

                return Card(
                  color: Colors.lightGreen,
                  child: ListTile(
                    leading: Image(
                      height: 60,
                      width: 80,
                      fit: BoxFit.contain,
                      image: AssetImage(item.image),
                    ),
                    title: Text(
                      item.title,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Price : ${item.price}',
                      textAlign: TextAlign.center,
                    ),
                    trailing: Stack(
                      children: [
                        TextButton(
                          onPressed: () {
                            cartObject.cart(item);
                          },
                          child: Text('Remove'),
                          style: TextButton.styleFrom(backgroundColor: Colors.black),
                        ),
                        Positioned(
                          right: 1,
                          top: 1,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 10,
                            child: Text(
                              itemCount.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}