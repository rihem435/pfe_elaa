
import 'package:flutter/material.dart';
import 'package:front/config/account_info_storage.dart';
import 'package:front/config/app_api.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
class TestView extends StatefulWidget{
  @override
_TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  List<Person> persons= [];

  @override
  void initState() {
    //adding item to list, you can add using json from network
    persons.add(Person(id:"1", name:"Hari Prasad Chaudhary", phone:"9812122233", address:"Kathmandu, Nepal"));
    persons.add(Person(id:"2", name:"Krishna Karki", phone:"9812122244", address:"Pokhara, Nepal"));
    persons.add(Person(id:"3", name:"Ujjwal Joshi", phone:"98121224444", address:"Bangalore, India"));
    persons.add(Person(id:"4", name:"Samir Hussain Khan", phone:"9812122255", address:"Karachi, Pakistan"));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              title:Text("Add And Delete List"),
              backgroundColor: Colors.redAccent,
          ),
          body: SingleChildScrollView( 
            child: Container( 
              padding: EdgeInsets.all(10),
              child: Column(
                children: persons.map((personone){
                      return Container(
                          child: Card(
                            child:ListTile( 
                              title: Text(personone.name),
                              subtitle: Text(personone.phone + "\n" + personone.address),
                              trailing: ElevatedButton( 
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.redAccent
                                  ),
                                  child: Icon(Icons.delete),
                                  onPressed: (){
                                    //delete action for this button
                                      persons.removeWhere((element){
                                            return element.id == personone.id;
                                      }); //go through the loop and match content to delete from list
                                      setState(() {
                                        //refresh UI after deleting element from list
                                      });   
                                  },
                                ),
                             ),
                          ),
                          
                      );
                  }).toList(),
                ),
            ),
          ) 
        
      );
  }
}

class Person{ //modal class for Person object
   String id, name, phone, address;
   Person({required this.id, required this.name, required this.phone, required this.address});
}