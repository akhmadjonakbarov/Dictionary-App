import 'dart:io';

import 'package:flutter/material.dart';

import '../models/word.dart';

class WordImage extends StatelessWidget {
  const WordImage({super.key, required this.height, required this.word});

  final double height;
  final Word word;

  @override
  Widget build(BuildContext context) {
    return word.image.contains('http')
        ? Container(
            height: height / 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  word.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        : SizedBox(
            width: double.infinity,
            height: height / 10,
            child: Image.file(
              File(word.image),
              fit: BoxFit.cover,
            ),
          );
  }
}
