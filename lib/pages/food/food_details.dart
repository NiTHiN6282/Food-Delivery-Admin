import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {
  String name;
  String img;
  String price;
  String desc;
  String foodid;
  String rating;

  FoodDetails({
    Key? key,
    required this.desc,
    required this.img,
    required this.name,
    required this.price,
    required this.foodid,
    required this.rating,
  }) : super(key: key);

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
              SizedBox(
                height: 20,
              ),
              Text("Rating: ${widget.rating.toString()}"),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('foods')
                            .doc(widget.foodid)
                            .update({"status": 0});
                      },
                      child: Icon(Icons.close_rounded)),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection('foods')
                            .doc(widget.foodid)
                            .update({"status": 1});
                      },
                      child: Icon(Icons.done_rounded)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
