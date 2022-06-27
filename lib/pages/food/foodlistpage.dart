import 'package:flutter/material.dart';
import 'package:fooddeliveryadmin/data.dart';
import 'package:fooddeliveryadmin/pages/food/food_details.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView.builder(
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetails(
                          desc: foodList[index]['desc'],
                          img: foodList[index]['img'],
                          name: foodList[index]['name'],
                          price: foodList[index]['price']),
                    ));
              },
              child: Card(
                child: ListTile(
                  leading: Image.network(
                    foodList[index]['img'],
                    width: scrWid / 5,
                    height: scrHei / 12,
                    fit: BoxFit.cover,
                  ),
                  title: Text(foodList[index]['name']),
                  subtitle: Text(foodList[index]['price'].toString()),
                  trailing: Icon(Icons.delete),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
