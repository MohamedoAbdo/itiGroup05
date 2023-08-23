import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/views/svscreen/page1.dart';
import 'package:helloworld/views/svscreen/page2.dart';
import 'package:helloworld/views/svscreen/page3.dart';

class hoam extends StatefulWidget {
  const hoam({super.key});

  @override
  State<hoam> createState() => _hoamState();
}

class _hoamState extends State<hoam> {
  int currentIndex=0;
  List<Widget>pages =[
  page1(),
  page2(),
  page3(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 81, 223),
        automaticallyImplyLeading:false ,
        leading: IconButton(
          onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios),
        ),

      ),
      body: pages[currentIndex],
      //body: Center(child: Text(widget.email),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "page1"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "page2"),
        BottomNavigationBarItem(icon: Icon(Icons.more),label: "page3"),
      ],
      onTap: (value) {
        currentIndex=value;
        setState(() {});
        print(value);
      },
      
      
      ),
    );
  }
}