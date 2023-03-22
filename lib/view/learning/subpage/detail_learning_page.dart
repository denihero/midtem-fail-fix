import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DetailLearningPage extends StatefulWidget {
  const DetailLearningPage({Key? key}) : super(key: key);

  @override
  State<DetailLearningPage> createState() => _DetailLearningPageState();
}

class _DetailLearningPageState extends State<DetailLearningPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<String>(
          future:rootBundle.loadString('assets/lesson/count.md'),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                shrinkWrap: true,
                selectable: true,
                data: snapshot.data ?? '',
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
