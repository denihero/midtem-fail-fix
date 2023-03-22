import 'package:flutter/material.dart';
import 'package:mideterm_fail/domain/model/grid_menu_model.dart';
import 'package:mideterm_fail/view/home/widget/grid_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List menuList = [
    MenuItem(Icons.school, 'Learning',),
    MenuItem(Icons.check, 'Practice'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GridCard(menuItem: menuList[index]);
          },
          itemCount: menuList.length,
        ),
      ),
    );
  }
}
