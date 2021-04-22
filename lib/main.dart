import 'package:flutter/material.dart';
import 'package:flutter_app_task/providers/upload_screen_provider.dart';
import 'package:flutter_app_task/screen/upload_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (ctx) => UploadScreenProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: UploadScreen.classname,
      routes: {
        UploadScreen.classname: (context) => UploadScreen(),
      },
    );
  }
}
