import 'package:flutter/material.dart';

class DownDetails extends StatelessWidget {
  final String textComponent;
  final String description;
  final String imageComponent;
  const DownDetails(
      {Key? key,
      required this.description,
      required this.imageComponent,
      required this.textComponent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  textComponent,
                  style: const TextStyle(fontSize: 25, color: Colors.grey),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Text(
                      description,
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
          child: Image.network(imageComponent),
        ),
      ],
    );
  }
}
