import 'package:flutter/material.dart';

Widget pageBody(String imgUrl, String title, String description) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Image.network(imgUrl),
        Text(title,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87)),
        Text(
          description,
          style: const TextStyle(fontSize: 20, color: Colors.black54),
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );
}
