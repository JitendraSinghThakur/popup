import 'package:flutter/material.dart';
import 'package:popup/listdart.dart';
import 'package:popup/styles.dart';
import 'hero_dialog_route.dart';

class OpenCustomerDetails extends StatefulWidget {
  const OpenCustomerDetails({Key? key}) : super(key: key);

  @override
  _OpenCustomerDetailsState createState() => _OpenCustomerDetailsState();
}

class _OpenCustomerDetailsState extends State<OpenCustomerDetails> {
  // String data3 = 'no';
  String datatoParent3 = 'Greetings from the coming father';

  void onDataChange3(val3) {
    print(val3);
    setState(() {
      textvalue = val3;
    });
  }

  String textvalue = "None";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return _OpenBox(
                datatoParent2: datatoParent3,
                callback2: (val3) => onDataChange3(val3));
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
          // createRectTween: (begin, end) {
          //   return CustomRectTween(begin: begin, end: end);
          // },
          child: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      //  height: MediaQuery.of(context).size.height * 1,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.2),
                        ),
                      ),
                      child: Text(
                        "Salesman/ Customer Rep",
                        style: TextStyle(letterSpacing: 0.5),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 1.2, color: Colors.lightBlue.shade900),
                        ),
                      ),
                      child: Text(textvalue),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const String _heroAddTodo = 'add-todo-hero';

class _OpenBox extends StatefulWidget {
  _OpenBox({Key? key, required this.datatoParent2, this.callback2})
      : super(key: key);
  final callback2;
  String datatoParent2;

  @override
  __OpenBoxState createState() => __OpenBoxState();
}

class __OpenBoxState extends State<_OpenBox> {
  String data = 'no';
  String datatoParent = 'Greetings from the coming father';
  void listData2(val2) {
    widget.callback2(val2);
  }

  void onDataChange(val) {
    print(val);
    listData2(val);
    setState(() {
      data = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          child: Material(
            color: AppColors.accentColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ListSearch(
                            datatoParent: datatoParent,
                            callback: (val) => onDataChange(val)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
