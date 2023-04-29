// ignore_for_file: sort_child_properties_last
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
// ignore: prefer_const_constructors
class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  DateTime d1 = DateTime.now();
  File? image;
  final imagepicker = ImagePicker();
  uploadimage() async {
    var pickedimage2 = await imagepicker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
    
    if (pickedimage2 != null) {
      setState(() {
        image = File(pickedimage2.path);
      });
    } else {}
  }

  uploadimagecam() async {
    var pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (pickedimage != null) {
      setState(() {
        image = File(pickedimage.path);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text(
          'Add Note',
        ),
        // titleTextStyle: TextStyle(color: Colors.black, fontSize: 23),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 3, right: 3),
        child: Column(children: [
          Form(
              child: Column(
            children: [
              TextFormField(
                maxLength: 30,
                cursorColor: Colors.grey[800],

                decoration: InputDecoration(
                    
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 225, 190, 231)),
                    ),
                  
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 245, 190, 51)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    
                    labelStyle: TextStyle(color: Colors.purple, fontSize: 17),
                    labelText: 'Title Note',
                    prefixIcon: Icon(
                      Icons.note_add,
                      color: Colors.purple,
                    )),
              ),
              TextFormField(
                maxLines: 4, minLines: 1,
                cursorColor: Colors.grey[800],
                decoration: InputDecoration(
         
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 225, 190, 231)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 245, 190, 51)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.purple, fontSize: 17),
                    labelText: ' Note',
                    prefixIcon: Icon(
                      Icons.note_add,
                      color: Colors.purple,
                    )),
              ),
              MaterialButton(
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              height: 170,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Please Chosse Image :',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  ),
                                  InkWell(
                                    onTap: uploadimage,
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.photo,
                                            color: Colors.purple[300],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'From Gallery',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: uploadimagecam,
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.camera,
                                            color: Colors.purple[300],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'From Camera',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        });
                  },
                  child: Text('Add Image For Note'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              MaterialButton(
                  color: Colors.purple,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  onPressed: () {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Done !',
                        desc: 'You have completed this step.......',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                        btnOkColor: Colors.purple,
                        btnCancelColor: Colors.purple[300])
                      ..show();
                  },
                  child: Text(
                    '" Add  Note "',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              
              Container(
                  height: 200,
                  child: image == null ? Text('') : Image.file(image!))
            ],
          ))
        ]),
      ),
    );
  }
}
