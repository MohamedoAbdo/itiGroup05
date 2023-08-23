import 'package:flutter/material.dart';

class mycustom_butten extends StatefulWidget {
  String buttonlabe1;
  void Function()?onTap;
   mycustom_butten({super.key,required this.buttonlabe1,
   required this.onTap, required Padding child,
    });

  @override
  State<mycustom_butten> createState() => _mycustom_buttenState();
}

class _mycustom_buttenState extends State<mycustom_butten> {
  @override
  Widget build(BuildContext context) {
    return      InkWell(
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                      child: Text(
                        widget.buttonlabe1,
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
              ),
            )
         ;
  }
}
//