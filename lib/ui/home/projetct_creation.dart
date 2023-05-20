import 'dart:convert';
import 'dart:io';

import 'package:brikoula/providers/project_provider.dart';
import 'package:brikoula/ui/home/btm_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:line_icons/line_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' ;



class project_creation extends StatefulWidget {
  @override
  _project_creationState createState() => _project_creationState();
}

class _project_creationState extends State<project_creation> {
  var projectref = FirebaseStorage.instance.ref('projects/') ;
  bool urgent = false;
  List<Asset> selected_images = <Asset>[];
  List files = [];
  TextEditingController address = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String adress = "";
  int i ;
  bool adselected = false;
  List indexes =[];
  bool hello = false ;
  List categories = [
    "Welding",
    "carpenting",
    "electricity",
    "moving",
    "architecture and conception",
    "building",
    "painter"
  ];
  List selected_ctg = [];
  Color primcolor = Color.fromRGBO(223, 172, 42, 1);


//  uploadimages(List<Asset> asset)async{
//   asset.forEach((element) async{
//     await projectref.putFile(element)
//   });
//  }



  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height * 0.08,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: width * 0.15,
                        height: width * 0.1,
                        decoration: BoxDecoration(
                            color: primcolor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.2,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          "My Project",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: height * 0.1,
                  width: width * 0.8,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: title,
                    style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
                    decoration: InputDecoration(
                      labelText: 'Project title',
                      labelStyle:
                      TextStyle(color: Colors.grey[600], letterSpacing: 0.5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(width * 0.1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 3, color: primcolor.withOpacity(.7)),
                        borderRadius: BorderRadius.circular(width * 0.1),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: height * 0.12,
                  width: width * 0.8,
                  child:  TextField(
                    maxLines: 2,
                    keyboardType: TextInputType.emailAddress,
                    controller: description,
                    style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle:
                      TextStyle(color: Colors.grey[600], letterSpacing: 0.5),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey[400]),
                        borderRadius: BorderRadius.circular(width * 0.1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 3, color: primcolor.withOpacity(.7)),
                        borderRadius: BorderRadius.circular(width * 0.1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                  alignment: Alignment.topCenter,
                  width: width * 0.9,
                  height: height * 0.06,
                  child: adress.isEmpty
                      ? Row(
                          children: [
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Address",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    adselected = !adselected;
                                  });
                                },
                                child: Container(
                                  height: height * 0.05,
                                  decoration: !adselected
                                      ? BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border: Border.all(
                                              width: 2, color: primcolor))
                                      : BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: primcolor),
                                  child: Center(
                                    child: Text(
                                      "My adress",
                                      style: TextStyle(
                                        color: adselected
                                            ? Colors.white
                                            : primcolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  return showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: Text("Add new adress"),
                                      content: TextField(
                                        controller: address,
                                        decoration: InputDecoration(
                                            icon: Icon(
                                                Icons.location_on_outlined)),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            address.clear();
                                          },
                                          child: Text(
                                            "Clear",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              adress = address.text;
                                            });
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Text(
                                            "Confirm",
                                            style: TextStyle(color: primcolor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Container(
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      border: Border.all(
                                          width: 2, color: primcolor)),
                                  child: Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          color: primcolor, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                "   Address",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Text(
                                "$adress",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  return showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: Text("Edit address"),
                                      content: TextField(
                                        controller: address,
                                        decoration: InputDecoration(
                                            icon: Icon(
                                                Icons.location_on_outlined)),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            address.clear();
                                          },
                                          child: Text(
                                            "Clear",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              adress = address.text;
                                            });
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Text(
                                            "Confirm",
                                            style: TextStyle(color: primcolor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )),
              SizedBox(
                height: width *0.04,
              ),
              Center(
                child: Text("Select Categories",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,letterSpacing: 1.5),),
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: width*0.05),
                width: width ,
                height: height * 0.16,
                child: Center(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context ,index){
                      return GestureDetector(
                        onTap: (){

                          if(indexes.contains(index)){
                            indexes.remove(index);

                            selected_ctg.remove(categories[index]) ;
                          }else{
                            indexes.add(index);
                            selected_ctg.add(categories[index]);

                          }
                          setState(() {
                            hello =!hello ;;
                          });
                          print(indexes) ;
                          print(selected_ctg);
                        },
                        child: Center(
                          child: Container(
                            height: width*0.2,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration:indexes.contains(index)? BoxDecoration( borderRadius: BorderRadius.all(
                                Radius.circular(15)),
                                color: primcolor):BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)),
                                border: Border.all(
                                    width: 2, color: primcolor)),
                            child: Center(child: Text("${categories[index]}",style: indexes.contains(index)?TextStyle(color: Colors.white):TextStyle(color: Colors.black45),)),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context ,index){
                      return SizedBox(
                        width: width * 0.05,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: width*0.02     ,),
              Container(
                height: height * 0.36,
                width: width,
                decoration: BoxDecoration(
                    color: primcolor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    selected_images.isEmpty ? GestureDetector(
                      onTap: loadAssets,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: Colors.white,
                        radius: Radius.circular(20),
                        dashPattern: [8, 4],
                        strokeWidth: 2,
                        child: Container(
                          height: height * 0.2,
                          width: width * 0.7,
                          child: Center(
                            child: Icon(
                              LineIcons.imageFile,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ) : Column(
                      children: [
                        Center(
                          child: Text(
                            "Project images",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),
                          ),
                        ),
                        Container(
                          height: height*0.15,
                          width: width*0.95,
                          child: Center(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: selected_images.length+1,
                              itemBuilder: (context , index){
                                if (index == selected_images.length) {
                                  return GestureDetector(
                                    onTap: loadAssets,
                                    child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: Colors.white,
                                    radius: Radius.circular(20),
                                    dashPattern: [8, 4],
                                    strokeWidth: 2,
                                    child: Container(
                                      height: height * 0.15,
                                      width: height *0.15,
                                      child: Center(
                                        child: Icon(
                                          LineIcons.imageFile,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                ),
                                  );
                                } else {
                                  return AssetThumb(
                                  asset: selected_images[index],
                                  width: (height*0.15).toInt(),
                                  height: (height*0.15).toInt(),
                                );
                                }

                              },
                              separatorBuilder: (contex,index){
                                return SizedBox(
                                  width: width*0.015,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Consumer<projectProvider>(builder: (context, project,child){
                      return GestureDetector(
                        onTap: (){
                          project.getprojectdata(
                           title.text.toString(),
                          description.text.toString(),
                          selected_ctg,
                          "El mourouj Bordj ghedir"
                          );
                          project.addproject();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Example()));
                        },
                        child: Container(
                          width: width * 0.9,
                          height: width * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              "Create Project",
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 2,
                                color: primcolor,
                              ),
                            ),
                          ),
                        ),
                      );

                    }),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

    Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: selected_images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#CCCC00",
          actionBarTitle: "Pick images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;
    setState(() {
      selected_images = resultList;
      // _error = error;
    });


  }
//  getImageFileFromAsset(String path)async{
//    final file = File(path) ;
//    return file ;
//  }
//  _submit() async {
//    for (int i = 0; i < selected_images.length; i++) {
//      var path2 =
//      await FlutterAbsolutePath.getAbsolutePath(selected_images[i].identifier);
//      var file = await getImageFileFromAsset(path2);
//      await projectref.putFile(file) ;
//  }
//  }
//  Future<List<String>> uploadImages(List<File> images) async {
//    if (images.length < 1) return null;
//
//    List<String> _downloadUrls = [];
//
//    await Future.forEach(images, (image) async {
//      Reference ref = FirebaseStorage.instance
//          .ref()
//          .child('jobPost');
//         // .child(getFileName(path: image));
//      final UploadTask uploadTask = ref.putFile(image);
//      final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
//      final url = await taskSnapshot.ref.getDownloadURL();
//      _downloadUrls.add(url);
//    });
//
//    return _downloadUrls;
//  }
}