import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'admob_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Prototype',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: AdWidget(
          key: UniqueKey(),
          ad: AdmobService.createBannerAd()..load(),
        ),
      ),
    );
  }
}
