import 'package:flutter/material.dart';

import '../models/image_model.dart';

// ImageList will not be changing the list of images
// present in the _AppState class therefore
// this will be a StatelessWidget.

// It will never change the list of images or try to
// re-render itself. Hence a Stateless Widget.
class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  const ImageList({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      // This itemBuilder will be called when the user
      // scrolls around
      itemBuilder: (BuildContext context, int index) {
        return buildImage(image: images[index], index: index);
      },
    );
  }
}

Widget buildImage({required ImageModel image, required int index}) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    margin: EdgeInsets.fromLTRB(20.0, (index == 0 ? 20.0 : 0.0), 20.0, 20.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: Column(
      children: <Widget>[
        Image.network(
          image.url,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          image.title,
        ),
      ],
    ),
  );
}
