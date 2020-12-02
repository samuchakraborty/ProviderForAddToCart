import 'package:ProvidorUsingProductPage/Store/MyStore.dart';
import 'package:badges/badges.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    //register Listener
    var store = Provider.of<MyStore>(context);
//
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Basket Page"),
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
      body: ListView.builder(
          itemCount: store.basket.length,
          itemBuilder: (context, i) {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    store.basket[i].image,
                    height: 50,
                    width: 50,
                  ),
                ),
                Expanded(
                    flex: 2, child: Text(store.basket[i].price.toString())),
                Expanded(flex: 2, child: Text(store.basket[i].name)),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 150,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              store.addOneItemtoBasket(store.basket[i]);
                            }),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber)),
                          child: Text(store.basket[i].qty.toString()),
                        ),
                        IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              store.removeOneItemtoBasket(store.basket[i]);
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
