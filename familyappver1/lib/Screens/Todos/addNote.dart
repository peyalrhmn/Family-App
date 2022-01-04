import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class AddNote extends StatelessWidget {

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        FlatButton(onPressed: (){
          ref.add({
            'title': title.text,
            'content': content.text,
          }).whenComplete(() => Navigator.pop(context));
        }, child: Text('Save'))
      ],),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: title,
              decoration: InputDecoration(hintText: 'Title'),
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: content,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: 'Write your note or task'),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}