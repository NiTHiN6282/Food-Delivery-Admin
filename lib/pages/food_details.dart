import 'package:flutter/material.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Details"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20),
          height: scrHei,
          width: scrWid,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Food Name"),
              SizedBox(
                height: 20,
              ),
              Text("Item price : "),
              SizedBox(
                height: 20,
              ),
              Text("Description: "),
            ],
          ),
        ),
      ),
    );
  }
}
