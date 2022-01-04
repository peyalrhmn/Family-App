import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

/*
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
  home: FirstPage(),
  ));
}
*/

class FirstPage extends StatefulWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
    ImagePicker image = ImagePicker();
    String url = "";
    File? file;
    getImage()async{
      var img = await image.pickImage(source: ImageSource.gallery);
      setState(() {
        file = File(img!.path);
      });
    }
    uploadFile() async {
      String name = DateTime.now().millisecondsSinceEpoch.toString();
      var imageFile = FirebaseStorage.instance.ref().child(name).child("/.jpg");
      UploadTask task = imageFile.putFile(file!);
      TaskSnapshot snapshot = await task;

      url = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance
      .collection("images")
      .doc()
      .set({"imageUrl":url});
      print(url);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          InkWell(
            onTap: (){
              getImage();
            },
            child: CircleAvatar(
              radius: 80,
              backgroundImage: file == null
              ? AssetImage("")
              : FileImage(File(file!.path)) as ImageProvider,
              ),
            ),
            ElevatedButton(onPressed: (){
              uploadFile();
            }, 
            child: Text("Upload Document Image")),
            //for showing images in our app
            StreamBuilder(
              stream: 
                FirebaseFirestore.instance.collection("images").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasData){
            return GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              primary: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 3
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i){
                QueryDocumentSnapshot x = snapshot.data!.docs[i];
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>View(
                        url: x['imageUrl'],
                      )));
                    },
                    child: Hero(
                      tag: x['imageUrl'],
                      child: Card(
                        child: Image.network(x['imageUrl'], fit: BoxFit.fill,),
                      ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator(), );
              },
            );
            }
            return Center(child: CircularProgressIndicator(),);
            })
          ],
        ),
      ),
    );
  }
}

class View extends StatelessWidget {
final url;
View({this.url});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: Image.network(url),
    );
  }
}

// to store image url in firebase

