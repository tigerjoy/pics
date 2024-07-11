class ImageModel {
  // Same as the properties of the JSON
  // Marking as late, other wise compiler
  // complains that they are non-nullable
  late int id;
  late String url;
  late String title;

  // Unnamed Constructor
  ImageModel({required this.id, required this.url, required this.title});

  // Named Constructor
  ImageModel.fromJson({required Map<String, dynamic> parsedJson}) {
    id = parsedJson["id"];
    url = parsedJson["url"];
    title = parsedJson["title"];
  }

  // Alternatively, short form syntax
  // ImageModel.fromJson({required Map<String, dynamic> parsedJson})
  //     : id = parsedJson["id"],
  //       url = parsedJson["url"],
  //       title = parsedJson["title"];

  @override
  String toString() {
    return "ImageModel(id:$id, url:'$url', title:'$title')";
  }
}
