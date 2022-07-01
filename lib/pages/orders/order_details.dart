import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  String name;
  String img;
  String user;
  String loc;
  String address;
  String email;
  int phone;
  int price;
  OrderDetails({
    Key? key,
    required this.address,
    required this.email,
    required this.loc,
    required this.name,
    required this.phone,
    required this.price,
    required this.user,
    required this.img,
  }) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    double scrHei = MediaQuery.of(context).size.height;
    double scrWid = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: scrHei,
        width: scrWid,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.name),
            SizedBox(
              height: 20,
            ),
            CachedNetworkImage(
              imageUrl: widget.img,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Price : ${widget.price.toString()}"),
            SizedBox(
              height: 20,
            ),
            Text("User : ${widget.user}"),
            SizedBox(
              height: 20,
            ),
            Text("Location : ${widget.loc}"),
            SizedBox(
              height: 20,
            ),
            Text("Address : ${widget.address}"),
            SizedBox(
              height: 20,
            ),
            Text("Email : ${widget.email}"),
            SizedBox(
              height: 20,
            ),
            Text("Phone : ${widget.phone.toString()}"),
            SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.center,
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("Cancel Order"),
            ),
          ],
        ),
      ),
    ));
  }
}
