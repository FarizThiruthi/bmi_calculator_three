import 'package:bmi_calculator_three/Provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final object = Provider.of<Provider_Class>(context);
    List products = object.favoriteProducts;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        clipBehavior: Clip.hardEdge,
        title: Text('Words'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(products[index]),
                trailing: IconButton(
                  onPressed: () {
                    object.favorites(products[index]);
                  },
                  icon: object.icn_change(products[index])
                      ? Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  )
                      : Icon(Icons.favorite_border),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
