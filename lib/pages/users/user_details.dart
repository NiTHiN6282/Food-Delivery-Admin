import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  String name;
  String address;
  int phone;
  UserDetails(
      {Key? key,
      required this.address,
      required this.name,
      required this.phone})
      : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
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
              Text("User Profile"),
              SizedBox(
                height: scrHei / 10,
              ),
              Text("Name : ${widget.name}"),
              SizedBox(
                height: scrHei / 15,
              ),
              Text("Address : ${widget.address}"),
              SizedBox(
                height: scrHei / 15,
              ),
              Text("Phone : ${widget.phone.toString()}"),
            ],
          ),
        ),
      ),
    );
  }
}
