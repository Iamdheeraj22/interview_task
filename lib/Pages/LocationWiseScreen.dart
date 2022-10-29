import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interview_task/Utils/Colors.dart';
import 'package:interview_task/Utils/Utils.dart';
import 'package:http/http.dart' as http;

import '../Model/LocationWiseModel.dart';

class LocationWise extends StatefulWidget {
  LocationWise({Key? key}) : super(key: key);

  @override
  State<LocationWise> createState() => _LocationWiseState();
}

class _LocationWiseState extends State<LocationWise> {
  final scrollController = ScrollController();
  int p = 1;

  bool isLoaded = false;
  List<Kitchens> itemList = [];
  var errorMsg = "";
  LocationWiseModel? _locationWiseModel;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_addScrollListener);
    getLocationWiseList(p.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoaded
            ? itemList.isNotEmpty
                ? GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.73,
                      crossAxisSpacing: width(context) / 13,
                    ),
                    shrinkWrap: true,
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return locationItem(itemList[index]);
                    })
                : Container(
                    child: Text(
                      errorMsg,
                      style: TextStyle(
                          color: darkGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
  }

  Widget locationItem(Kitchens kitchens) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: height(context) / 6,
                width: width(context) / 2.5,
                fit: BoxFit.fill,
                imageUrl: kitchens.images![0].path.toString(),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              kitchens.name.toString(),
              style: TextStyle(
                  color: darkGrey, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              kitchens.description == null
                  ? "Tasty & Healthy"
                  : kitchens.description.toString(),
              style: TextStyle(
                  color: grey, fontSize: 13, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(
                    Icons.star,
                    size: 10,
                    color: white,
                  ),
                ),
                Text(
                  kitchens.ratingCount == null
                      ? " 3"
                      : kitchens.ratingCount.toString(),
                  style: TextStyle(
                      color: darkGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_outline,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getLocationWiseList(String page) async {
    setState(() {
      isLoaded = false;
    });
    var jsonResponse = null;
    final url =
        "https://mitabl.xcelanceweb.com/api/v1/nearestRestaurant?page=$page&limit=6";
    print("url -------$url");
    Map bodyData = {"lat": "30.6754", "lon": "76.7405", "max_distance": "50"};
    var response = await http.post(Uri.parse(url),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbWl0YWJsLnhjZWxhbmNld2ViLmNvbVwvYXBpXC9sb2dpbiIsImlhdCI6MTY2NTQ2OTQ4NiwibmJmIjoxNjY1NDY5NDg2LCJqdGkiOiI1em5rWXVSNGNIWGd3NEp1Iiwic3ViIjo5MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.NkOCOjMemeRl9P4Sihij79QVIOrIxTaJ1McmMjI1B-Y',
        },
        body: bodyData);

    print(response.body);
    jsonResponse = json.decode(response.body);
    var message = jsonResponse["message"];
    setState(() {
      isLoaded = true;
    });
    errorMsg = message;
    if (response.statusCode == 200) {
      _locationWiseModel = LocationWiseModel.fromJson(jsonResponse);
      itemList = itemList + _locationWiseModel!.data!.kitchens!;
      print("success");
    } else if (response.statusCode == 401) {
      throw Exception("Unauthorized user!");
    } else {
      throw Exception("Failed to load the work experience!");
    }
  }

  void _addScrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      p = p + 1;
      getLocationWiseList(p.toString());
    }
  }
}
