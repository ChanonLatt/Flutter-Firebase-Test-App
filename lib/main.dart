import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:food_expense/modules/home_page/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _addData() {
    const Map<String, dynamic> data = {"name": 'Hik HIk', "price": 0000};
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("test");
    collectionReference
        .add(data)
        .then((value) => () {
              debugPrint('success');
            })
        .catchError((error) {
      debugPrint(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        alignment: Alignment.center,
        color: Colors.pink,
        child: ElevatedButton(
          child: const Text('Post data'),
          onPressed: _addData,
        ),
      ),
    ));
  }
}
