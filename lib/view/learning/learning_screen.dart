import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mideterm_fail/domain/data/book_data.dart';
import 'package:mideterm_fail/domain/model/book_model.dart';
import 'package:mideterm_fail/view/learning/subpage/detail_learning_page.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  List<Lesson> bookData = BookData.lessonsData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Окуу'),
      ),
      body: GridView.builder(
        itemCount: bookData.length,
        padding: const EdgeInsets.only(left: 5, right: 5),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 200,
            width: 200,
            child: Card(
              child: GridTile(
                footer: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      bookData[index].className,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailLearningPage(
                          book: bookData[index].book,
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    bookData[index].book.bookImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
          ));
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.7
        ),
      ),
    );
  }
}
