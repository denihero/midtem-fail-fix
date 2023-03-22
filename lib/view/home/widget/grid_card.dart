import 'package:flutter/material.dart';
import 'package:mideterm_fail/domain/model/grid_menu_model.dart';

class GridCard extends StatelessWidget {
  const GridCard({Key? key, required this.menuItem}) : super(key: key);

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
            onTap: () {},
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          menuItem.icon,
                          size: 50,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        menuItem.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
