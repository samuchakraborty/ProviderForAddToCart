import 'package:ProvidorUsingProductPage/Page/BasketPage.dart';
import 'package:ProvidorUsingProductPage/Store/MyStore.dart';
import 'package:badges/badges.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //register Listener
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details Page"),
        // actions: [
        //   InkWell(
        //       onTap: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => BasketPage()));
        //       },
        //       child: Text(store.basket.length.toString())),
        // ],

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
      body: Container(
        child: Column(
          children: [
            Text(store.activeProducts.name),
            // Image.asset(store.activeProducts.image),

            Image.network(store.activeProducts.image),
            Text(store.activeProducts.price.toString()),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        store.addOneItemtoBasket(store.activeProducts);
                      }),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.amber)),
                    child: Text(store.activeProducts.qty.toString()),
                  ),
                  IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        store.removeOneItemtoBasket(store.activeProducts);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
