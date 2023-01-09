import 'package:flutter/material.dart';
import 'package:mahara_db/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) {
        return AppProvider();
      },
      child: MaterialApp(
        home: MySpScreen(),
      ),
    );
  }
}

class MySpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AppProvider>(builder: (context, provider, x) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(provider.name ?? 'not defined'),
            SizedBox(height: 20,),
            TextField(
              controller: provider.editingController,
            ),
            ElevatedButton(
                onPressed: () {
                  provider.saveUser();
                },
                child: Text('Enter Name in Sp'))
          ],
        );
      }),
    );
  }
}