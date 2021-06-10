import 'package:flutter/material.dart';
import 'package:popup/styles.dart';

class ListSearch extends StatefulWidget {
  ListSearch({Key? key, required this.datatoParent, this.callback})
      : super(key: key);
  final callback;
  String datatoParent;
  ListSearchState createState() => ListSearchState();
}

class ManageName {
  int id;
  String fname;
  String lname;
  bool checked;

  ManageName(this.id, this.fname, this.lname, this.checked);
}

class ListSearchState extends State<ListSearch> {
  void listData(id, fname, lname) {
    widget.callback(fname);
    for (var i = 0; i < newDataList.length; i++) {
      newDataList[i].checked = false;
      if (newDataList[i].id == id) {
        newDataList[i].checked = true;
      }
    }
  }

  TextEditingController _textController = TextEditingController();

  static List<ManageName> mainDataList = [
    new ManageName(1, "Ram", "Singh", false),
    new ManageName(2, "Rohit", "Singh", false),
    new ManageName(3, "Amit ", "Singh", false),
    new ManageName(4, "Mohit ", "Rahu", false),
    new ManageName(5, "Neha ", "Sharma", false),
    new ManageName(6, "Mohit ", "Sahu", false),
    new ManageName(7, "Priya ", "Sharma", false),
    new ManageName(8, "Akhilesh ", "Arora", false),
    new ManageName(9, "Aditaya ", "Sahu", false),
    new ManageName(10, "Narendra ", "Pal", false),
    new ManageName(11, "Amrita ", "Singh", false),
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
                  trailing: data.checked ? Icon(Icons.check) : null,
                  onTap: () {
                    listData(data.id, data.fname, data.lname);
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
