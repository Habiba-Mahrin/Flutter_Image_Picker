import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {


  Myapp({Key? key}) : super(key: key);


  File? imageFile;

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text("Take or Pick Images"),
          leading: Icon(Icons.home),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
            child:Column(

              children:[
                const SizedBox(height:20),
            ElevatedButton.icon(onPressed: (){getImage(source: ImageSource.camera);
              print('press');
              },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  textStyle: TextStyle(fontSize:15, fontStyle: FontStyle.italic) ,
                  elevation: 25,
                  shadowColor: Colors.blueGrey
                ),
               icon: Icon(Icons.camera),
               label: const Text('Take')
            ),
                const SizedBox(height:20),
                 ElevatedButton.icon(onPressed: (){ getImage(source: ImageSource.gallery);
                  print('press');
                },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        textStyle: TextStyle(fontSize:15, fontStyle: FontStyle.italic) ,
                        elevation: 25,
                        shadowColor: Colors.blueGrey
                    ),
                    icon: Icon(Icons.photo_album),
                    label: const Text('Pick')
                ),
                const SizedBox(height:100),
                 Image.asset('assets/images/cow.jpg')

              ]
            ),
          ),
        ),
    );

  }
  void getImage({required ImageSource source}) async {
   final file = await ImagePicker().pickImage(source: source);
   if(file?.path !=null){
     setState((){
       imageFile= File(file!.path);

     });
   }
  }

  
}

void setState(Null Function() param0) {
}
