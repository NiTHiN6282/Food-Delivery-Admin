import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: scrHei,
          width: scrWid,
          child: ListView(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                color: Colors.grey[400],
                child: ListTile(
                  leading: Icon(Icons.food_bank_rounded),
                  title: Text(
                    "Food",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                color: Colors.grey[400],
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    "Users",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                color: Colors.grey[400],
                child: ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text(
                    "Orders",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
