import 'package:flutter/material.dart';
import 'package:popup/styles.dart';

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ManageName {
  int id;
  String fname;
  String lname;

  ManageName(this.id, this.fname, this.lname);
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  static List<ManageName> mainDataList = [
    new ManageName(1, "Ram", "Singh"),
    new ManageName(2, "Rohit", "Singh"),
    new ManageName(3, "Amit ", "Singh"),
    new ManageName(4, "Mohit ", "Rahu"),
    new ManageName(5, "Neha ", "Sharma"),
    new ManageName(6, "Mohit ", "Sahu"),
    new ManageName(7, "Priya ", "Sharma"),
    new ManageName(8, "Akhilesh ", "Arora"),
    new ManageName(9, "Aditaya ", "Sahu"),
    new ManageName(10, "Narendra ", "Pal"),
    new ManageName(11, "Amrita ", "Singh"),
  ];

  // Copy Main List into New List.
  List<ManageName> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((managename) =>
              managename.fname.toLowerCase().contains(value.toLowerCase()) ||
              managename.lname.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Row(
            children: [
              Text("Salesman/Customer Rep"),
              SizedBox(
                width: 70,
              ),
              InkWell(
                child: Icon(Icons.cancel),
                onTap: () => {print("Close")},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('img/images/jitendra.jpeg'),
                  ),
                  title: Text(data.fname + " " + data.lname),
                  onTap: () => print(data.fname),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
