// Import flutter helper library
import 'package:flutter/material.dart';
// Imports everything from the http package
// import 'package:http/http.dart' as http;

// Import only the get() method from the
// http package
import 'package:http/http.dart' as http show get;
import 'dart:convert';

import 'models/image_model.dart';
import 'widgets/image_list.dart';

// Create a StatefulWidget class
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  _AppState();

  void fetchImage() async {
    // counter += 1;
    counter++;
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter");
    // This is not the JSON response but the entire response
    // such as the responseCode, json(), text() etc
    final response = await http.get(url);
    // Gives explicit types of the JSON data
    final imageModel = ImageModel.fromJson(
        parsedJson: jsonDecode(response.body) as Map<String, dynamic>);
    setState(() {
      images.add(imageModel);
    });
  }

  // Must define a 'build' method that returns
  // the widgets that *this* widget will show
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Let's see some images!"),
        ),
        floatingActionButton: FloatingActionButton(
          // onPressed: () {
          //   // Modify the data inside the setState void callback
          //   // Update the UI with the new value of count
          //   // setState(() {
          //   //   counter++;
          //   // });

          //   fetchImage();
          // },

          // Using funtion references directly
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Center(child: Text("$counter Images")),
        //   ],
        // ),
        body: ImageList(images: images),
      ),
    );
  }
}
