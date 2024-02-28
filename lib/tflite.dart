

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/main.dart';
import 'package:tflite/tflite.dart';
class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _result;
  bool imageSelect=false;

  void initstate()
  {
    super.initState();
    loadModel();
  }
  Future loadModel()
  async{
   Tflite.close();
       String res;
   res=(await Tflite.loadModel(model:'assets/ResNet50_lumpy.tflite',labels:'assets/labels.txt'))!;
   print('Models loading status:$res');
  }

  Future imageClassification(File image)
  async{

    var recognitions =await Tflite.runModelOnImage(
        path: image.path,
      numResults:6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd:126.5,
    );
    setState(() {
      _result=recognitions!;
      _image=image;
      imageSelect=true;




    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
