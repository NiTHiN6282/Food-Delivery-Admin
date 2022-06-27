import 'package:flutter/material.dart';
import 'package:fooddeliveryadmin/pages/orders/order_list.dart';
import 'package:fooddeliveryadmin/pages/users/userslistpage.dart';

import 'package:fooddeliveryadmin/screens/food.dart';

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
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Food(),
                      ));
                },
                child: Container(
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
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersListPage(),
                      ));
                },
                child: Container(
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
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderList(),
                      ));
                },
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
