import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
class Pup_up extends StatefulWidget {
  @override
  _Pup_upState createState() => _Pup_upState();
}

class _Pup_upState extends State<Pup_up> {
TextEditingController _todoController = TextEditingController();
String _showText = "";

_onPressed(){
  setState(() {
   _showText = _todoController.text;
  });
}
  // create function
  createAlertPupUp(BuildContext context){ // this is an function that it will build context
    return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Alert something... Text: $_showText"),
          content: TextField(
            controller: _todoController,
            autocorrect: true,
            decoration: InputDecoration(
              // border: InputBorder.none,
              hintText: 'Add something...'
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), 
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text("Add new.."),
              onPressed: _onPressed(){
                Navigator.of(context).pop(_todoController.text.toString()); // when I click on button it will lost pup-up
              },
            ),
            
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal Dialog"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){createAlertPupUp(context);},
      ),
    );
  }
}