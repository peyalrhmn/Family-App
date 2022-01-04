import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class EditNote extends StatefulWidget {

  DocumentSnapshot docToEdit;
  EditNote({required this.docToEdit});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    title = TextEditingController(text: widget.docToEdit['title']);
    content = TextEditingController(text: widget.docToEdit['content']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        FlatButton(onPressed: (){

          widget.docToEdit.reference.update(
            {
              'title': title.text,
              'content': content.text,
       }).whenComplete(() => Navigator.pop(context));

//          ref.add({
//            'title': title.text,
//            'content': content.text,
//         }).whenComplete(() => Navigator.pop(context));
        }, child: Text('Save')),
            FlatButton(onPressed: (){

          widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));

//          ref.add({
//            'title': title.text,
//            'content': content.text,
//         }).whenComplete(() => Navigator.pop(context));
        }, child: Text('Delete'))
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