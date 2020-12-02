import 'package:ProvidorUsingProductPage/Page/ProductListPage.dart';
import 'package:ProvidorUsingProductPage/Store/MyStore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return MyStore();
      },
      child: MaterialApp(
        home: ProductListPage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
