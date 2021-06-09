import 'package:flutter/material.dart';
import 'package:popup/listdart.dart';
import 'package:popup/styles.dart';
import 'hero_dialog_route.dart';

// Opens a [HeroDialogRoute] of [_AddTodoPopupCard].
///
// Uses a [Hero] with tag [_heroAddTodo].
// {@endtemplate}

class OpenCustomerDetails extends StatefulWidget {
  const OpenCustomerDetails({Key? key}) : super(key: key);

  @override
  _OpenCustomerDetailsState createState() => _OpenCustomerDetailsState();
}

class _OpenCustomerDetailsState extends State<OpenCustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const _OpenBox();
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
              child: InkWell(
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
                      child: Text('None'),
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

/// Tag-value used for the add todo popup button.
const String _heroAddTodo = 'add-todo-hero';

/// {@template add_todo_popup_card}
/// Popup card to add a new [Todo]. Should be used in conjuction with
/// [HeroDialogRoute] to achieve the popup effect.
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}

class _OpenBox extends StatefulWidget {
  const _OpenBox({Key? key}) : super(key: key);

  @override
  __OpenBoxState createState() => __OpenBoxState();
}

class __OpenBoxState extends State<_OpenBox> {
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
                        child: ListSearch(),
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
