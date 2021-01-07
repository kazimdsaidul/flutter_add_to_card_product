import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_product_list.dart';

class ProjectList extends StatefulWidget {
  final String title;

  ProjectList({Key key, this.title}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {},
            ),
            Positioned(
              right: 18,
              top: 4,
              child: Text("0"),
            )
          ],
        )
      ]),
      body: ListView.builder(
          itemCount: DummyProductList.products.length,
          itemBuilder: (context, index) {
            final product = DummyProductList.products[index];
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  radius: double.infinity,
                  backgroundImage: NetworkImage(product.image),
                ),
              ),
              title: Text(product.name),
              subtitle: Text("\$${product.price}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                  ),
                ],
              ),
            );
          }),
    );
  }

  ListView buildSimpleList() {
    return ListView(
      children: <Widget>[
        Text("test1"),
        Text("test2"),
        Text("test3"),
        Text("test3"),
      ],
      padding: EdgeInsets.all(25.0),
      primary: true,
      scrollDirection: Axis.vertical,
    );
  }

  ListView listViewWithIcon() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("test"),
          leading: Icon(Icons.photo_album),
        ),
        ListTile(
          title: Text("test1"),
          leading: Icon(Icons.phonelink_sharp),
        )
      ],
      padding: EdgeInsets.all(25.0),
      primary: true,
      scrollDirection: Axis.vertical,
    );
  }
}
