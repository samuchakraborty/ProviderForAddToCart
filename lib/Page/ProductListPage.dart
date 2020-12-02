import 'package:ProvidorUsingProductPage/Page/ProductDetailsPage.dart';
import 'package:ProvidorUsingProductPage/Store/MyStore.dart';
import 'package:badges/badges.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ProvidorUsingProductPage/Page/BasketPage.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    print(store.products[0].name);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List Page"),
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            badgeContent: Text(
              store.basket.length.toString(),
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BasketPage()));
                //
                // setState(() {
                //   _counter += 1;
                // });

                //
              },
              icon: Icon(EvaIcons.shoppingCart),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: store.products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              //set item on as a active product
              store.setActiveProduct(store.products[i]);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(),
                ),
              );
            },
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        child: FadeInImage.assetNetwork(
                            placeholder: 'assets/products/loading.gif',
                            image: store.products[i].image),
                      ),
                      Text(store.products[i].name),
                      Text(store.products[i].price.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ); //Text(store.products[i].name);
        },
      ),
    );
  }
}
