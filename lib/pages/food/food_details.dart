import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  String name;
  String img;
  int price;
  String desc;

  FoodDetails(
      {Key? key,
      required this.desc,
      required this.img,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(widget.name),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 150,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.img),
                ),
              ),
              Text("Item price : ${widget.price.toString()}"),
              SizedBox(
                height: 20,
              ),
              Text("Description: ${widget.desc.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
