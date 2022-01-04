import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familyappver1/Screens/Todos/addNote.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'editNote.dart';


class Todo extends StatelessWidget {

  final ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(('Family Notes and To-dos')),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>AddNote()));
      },),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (_,index){
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>EditNote(docToEdit: snapshot.data!.docs[index],)));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 150,
                color: Colors.blue[200],
                child: Column(
                  children: [
                    Text(snapshot.data?.docs[index]['title']),
                    Text(snapshot.data?.docs[index]['content']),
                  ],
                ),
              ),
            );
          },
          );
        }
      ),
    );
  }
}


