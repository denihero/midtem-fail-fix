import 'package:flutter/material.dart';
import 'package:mideterm_fail/view/learning/subpage/detail_learning_page.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text("${index + 1}"),
            title: const Text('Цвет, форма, размер'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailLearningPage()));
            },
          );
        },
      ),
    );
  }
}
