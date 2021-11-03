import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllDetails extends StatefulWidget {
  final String headerImage;
  final String headerTitle;
  final String textComponent;
  final String description;
  final String imageComponent;
  const AllDetails(
      {Key? key,
      required this.headerImage,
      required this.headerTitle,
      required this.description,
      required this.imageComponent,
      required this.textComponent})
      : super(key: key);

  @override
  _AllDetailsState createState() => _AllDetailsState();
}

class _AllDetailsState extends State<AllDetails> {
  var loading = true;
  var details;
  void apiResponse() async {
    http.Response response = await http.get(
      Uri.parse(
          'http://website-bucket-12234.s3-website-us-east-1.amazonaws.com/api.json'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        details = data["data"];
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
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.headerImage),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 40),
              child: Text(
                widget.headerTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 700,
          color: Colors.yellow.shade100,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.textComponent,
                  style: const TextStyle(fontSize: 25, color: Colors.grey),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.description,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 400,
          width: MediaQuery.of(context).size.width,
          child: Image.network(widget.imageComponent),
        ),
      ],
    );
  }
}
