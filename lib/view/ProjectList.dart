import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_add_to_card_product/bloc/cart_bloc.dart';
import 'package:flutter_add_to_card_product/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import '../dummy_product_list.dart';

class ProjectList extends StatefulWidget {
  final String title;

  ProjectList({Key key, this.title}) : super(key: key);

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardBloc>(context).add(PageLoad());
  }

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
            BlocBuilder<CardBloc, CardState>(builder: (context, cartState) {
              if (cartState is CardOperationSuccess &&
                  cartState.cardItem.length > 0) {
                return Positioned(
                  right: 18,
                  top: 4,
                  child: Text("${cartState.cardItem.length}"),
                );
              } else if (cartState is CardLoading) {
                return Center(
                  child: Container(
                    child: Text("Loading...."),
                  ),
                );
              } else {
                return Positioned(right: 18, top: 4, child: Text(""));
              }
            })
          ],
        )
      ]),
      body: BlocBuilder<CardBloc, CardState>(builder: (context, cartState) {
        if (cartState is ProjectAdded) {
          var listProject = cartState.listProduct;
          return ListView.builder(
              itemCount: listProject.length,
              itemBuilder: (context, index) {
                var product = listProject[index];
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
                        onPressed: () {
                          BlocProvider.of<CardBloc>(context)
                              .add(AddToCard(product));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          BlocProvider.of(context)
                              .emit(RemoveFromCard(product));
                        },
                      ),
                    ],
                  ),
                );
              });
        } else {
          return Center(
            child: Container(
              child: Text("No product found"),
            ),
          );
        }
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

class DefalutProductList extends StatelessWidget {
  const DefalutProductList({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              BlocProvider.of<CardBloc>(context).add(AddToCard(product));
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              BlocProvider.of(context).emit(RemoveFromCard(product));
            },
          ),
        ],
      ),
    );
  }
}
