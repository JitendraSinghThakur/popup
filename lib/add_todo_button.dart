import 'package:flutter/material.dart';
import 'package:popup/listdart.dart';
import 'package:popup/styles.dart';

// import 'custom_rect_tween.dart';
import 'hero_dialog_route.dart';

/// {@template add_todo_button}
/// Button to add a new [Todo].
///
/// Opens a [HeroDialogRoute] of [_AddTodoPopupCard].
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class AddTodoButton extends StatelessWidget {
  /// {@macro add_todo_button}
  const AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const _AddTodoPopupCard();
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
          // createRectTween: (begin, end) {
          //   return CustomRectTween(begin: begin, end: end);
          // },
          child: Material(
            color: AppColors.accentColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
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
class _AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _AddTodoPopupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          // createRectTween: (begin, end) {
          //   return CustomRectTween(begin: begin, end: end);
          // },
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Row(
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
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     labelText: "Search here",
                    //     // border: InputBorder.none,
                    //     fillColor: Colors.red,

                    //     border: OutlineInputBorder(
                    //         borderSide:
                    //             BorderSide(color: Colors.red, width: 32.0),
                    //         borderRadius: BorderRadius.circular(25.0)),
                    //     // icon: new Icon(Icons.search),

                    //     prefixIcon: Icon(Icons.search),
                    //   ),
                    // ),

                    Container(
                      // width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.70,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: ListSearch(),
                      ),
                    ),
                    // const TextField(
                    //   decoration: InputDecoration(
                    //     hintText: 'Write a note',
                    //     border: InputBorder.none,
                    //   ),
                    //   cursorColor: Colors.white,
                    //   maxLines: 6,
                    // ),
                    // const Divider(
                    //   color: Colors.white,
                    //   thickness: 0.2,
                    // ),
                    // FlatButton(
                    //   onPressed: () {},
                    //   child: const Text('Add'),
                    // ),
                    // Container(
                    //   child: Text("Hello"),
                    // ),
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
