import 'package:flutter/material.dart';
import 'package:fooddeliveryadmin/pages/food/add_food.dart';

import 'package:fooddeliveryadmin/pages/food/foodlistpage.dart';

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: scrWid,
            height: scrHei,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodListPage(),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: scrWid / 1.5,
                    height: scrHei / 10,
                    decoration: BoxDecoration(
                        color: Colors.red[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Text("View Foods"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AddFood();
                      },
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: scrWid / 1.5,
                    height: scrHei / 10,
                    decoration: BoxDecoration(
                        color: Colors.red[200],
                        borderRadius: BorderRadius.circular(12)),
                    child: Text("Add Foods"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
