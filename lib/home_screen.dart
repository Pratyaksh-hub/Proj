import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internshala_assignment/screens/all_details.dart';

class HomeScreen extends StatefulWidget {
  static var details;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var loading = true;
  void apiResponse() async {
    http.Response response = await http.get(
      Uri.parse(
          'http://website-bucket-12234.s3-website-us-east-1.amazonaws.com/api.json'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        HomeScreen.details = data["data"];
        loading = false;
      });
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    apiResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: loading
                ? const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : Theme(
                    data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                        crossAxisMargin: 30,
                        trackBorderColor:
                            MaterialStateProperty.all(Colors.grey),
                        trackColor: MaterialStateProperty.all(Colors.grey),
                        thumbColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      showTrackOnHover: true,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return AllDetails(
                            textComponent: HomeScreen.details["components"][1]
                                ["title"],
                            imageComponent: HomeScreen.details["components"][0]
                                ["url"],
                            description: HomeScreen.details["components"][1]
                                ["desc"],
                            headerImage: HomeScreen.details["coverUrl"],
                            headerTitle: HomeScreen.details["title"],
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
