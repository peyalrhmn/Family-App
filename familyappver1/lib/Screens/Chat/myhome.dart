import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Ifad'),
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Icon(Icons.info_outline),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: Text('New Message',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
                ),
              ],
            ),
          ),
          ),
          Container(
            height: 50,
            color: Colors.grey.shade300,
            child: Row(
              children: [
                Expanded(
                child: Container(
                  margin: EdgeInsets.all(7),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ),
                  IconButton(icon: Icon(Icons.send), onPressed: () {},),
              ],
            ),
          ),
        ],
      ),
    );
  }
}