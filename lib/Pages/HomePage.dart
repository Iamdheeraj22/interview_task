import 'package:flutter/material.dart';
import 'package:interview_task/Utils/Colors.dart';
import 'package:interview_task/Utils/Utils.dart';

import 'LocationWiseScreen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height(context) / 12,
            ),
            //Header portion
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 25,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/panda.jpg",
                      )),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Hello, Emelia",
                  style: TextStyle(
                      color: darkGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const InkWell(
                  child: Icon(
                    Icons.notifications_outlined,
                    color: primaryColor1,
                  ),
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            //Searching portion
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(209, 228, 227, 227)),
                  width: width(context) / 1.4,
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        hintText: "Enter your address!",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: grey,
                            fontSize: width(context) / 28,
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins'),
                        fillColor: white,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: white,
                            fontSize: width(context) / 30,
                            decoration: TextDecoration.none,
                            fontFamily: 'Poppins'),
                        suffixIcon: const Icon(Icons.search)),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.sort,
                    color: primaryColor1,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //Mitabi RecommondedView
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "mitabi recommonded",
                style: TextStyle(
                    color: primaryColor1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(20)),
              height: height(context) / 2.9,
              margin: const EdgeInsets.only(left: 25, top: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (itemBuilder, index) {
                    return Material(
                      elevation: 2.0,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        width: width(context) / 1.2,
                        child: Column(children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.asset(
                              "assets/burger.jpg",
                              height: height(context) / 5,
                              fit: BoxFit.fill,
                              width: width(context) / 1.2,
                            ),
                          ),
                          Container(
                            width: width(context) / 1.2,
                            color: white,
                            padding: EdgeInsets.only(top: 5, left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Buger 2.0",
                                  style: TextStyle(
                                      color: darkGrey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "You're the only burn for me",
                                  style: TextStyle(
                                    color: grey,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_pin,
                                      size: 15,
                                      color: primaryColor1,
                                    ),
                                    Text(
                                      "  4.3km",
                                      style: TextStyle(
                                        color: grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: primaryColor1,
                                    ),
                                    Text(
                                      "  3",
                                      style: TextStyle(
                                        color: grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    );
                  }),
            ),

            const SizedBox(
              height: 20,
            ),
            //Top rated
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "top rated",
                style: TextStyle(
                    color: primaryColor1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              height: height(context) / 8,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: primaryColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                "assets/burger.jpg",
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Burger",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
                                  "tasty & healthy",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Text(
                                  "why not both?",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Icon(
                                        Icons.star,
                                        size: 10,
                                        color: white,
                                      ),
                                    ),
                                    const Text(
                                      "  4.3",
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, bottom: 8.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.favorite_outline,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    );
                  }),
            ),

            const SizedBox(
              height: 30,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "micook near my location",
                style: TextStyle(
                    color: primaryColor1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: height(context) / 2,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
              width: width(context),
              child: LocationWise(),
            ),
          ],
        ),
      ),
    );
  }
}
