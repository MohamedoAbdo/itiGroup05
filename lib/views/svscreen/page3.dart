import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => page3State();
}

class page3State extends State<page3> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('mohammed').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child:CircularProgressIndicator() ,);
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['nema']),
              subtitle: Text(data['price']),
            );
          }).toList(),
        );
      },
    );
  }
}
//users