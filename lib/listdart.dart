import 'package:flutter/material.dart';
import 'package:popup/styles.dart';

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Ram Singh",
    "Rohit Singh",
    "Amit Malwiya",
    "Mohit Aror",
    "Salim Khan",
    "Neha Parmar",
    "Priya Pathak",
    "Mohit Pathak",
    "Mahi Rathi",
    "Sunit Sharma",
    "Akhilesh Yadav",
    "Aditaya Singh",
    "Narendra Sahu",
    "Tej Pal",
    "Amrit Singh",
    "Amrita Singh",
    "Priya Sajan",
    "Himanshu Kanijiya"
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      body: Column(
        children: <Widget>[
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
                  title: Text(data),
                  onTap: () => print(data),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
