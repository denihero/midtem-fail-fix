import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mideterm_fail/domain/model/book_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DetailLearningPage extends StatefulWidget {
  const DetailLearningPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  State<DetailLearningPage> createState() => _DetailLearningPageState();
}

class _DetailLearningPageState extends State<DetailLearningPage> {
  File? path;
  String? bookName;

  Future<File> loadPdfFromAssets(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();

    return storeFile(path, bytes);
  }

  Future<File> storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    bookName = filename;
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');

    await file.writeAsBytes(bytes, flush: true);

    return file;
  }

  @override
  void initState() {
    loadPdfFromAssets(widget.book.pathBook).then((value) {
      setState(() {
        path = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.bookName,style: const TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: path != null
          ? PDFView(
              filePath: path?.path,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
