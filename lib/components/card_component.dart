import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    Key key,
    this.title,
    this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(1.0),
        child: Card(
            child: ListTile(
          leading: Icon(Icons.note),
          title: Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          subtitle: Text(
            body,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        )));
  }
}
