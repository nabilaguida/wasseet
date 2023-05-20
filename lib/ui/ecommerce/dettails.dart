import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';


class dettails extends StatefulWidget {
  @override
  _dettailsState createState() => _dettailsState();
}

class _dettailsState extends State<dettails> {

  Color currentColor = Colors.limeAccent;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);
  Color primary = Color.fromRGBO(19, 36, 40, 1);
  int qntt = 1 ;
  int selectedsize = 100000;
  Color secondary = Color.fromRGBO(233, 196, 106, 1);
  List sizes = ["1", "10", "20", "30", "50"];
  List<String> exaples = [
    "images/redroom/88262b92f30cf64cde031f41269de036.jpg",
    "images/redroom/41158925-white-blank-poster-on-shelve-and-drop-to-the-ground-in-an-empty-room-is-painted-red-with-decorate-wo.jpg",
    "images/redroom/Red-Painted-Office.jpg",
    "images/redroom/room-function-paint-guide.jpg",
    "images/redroom/room-painted-bright-red.jpg",
    "images/redroom/room-painted-bright-red.jpg"
  ];

  @override
  Widget build(BuildContext context) {
 //   var select = Provider.of<appprovider>(context) ;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Container(
                height: 300,
                //color: Colors.green,
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          color: currentColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(250),
                          )),
                    ),
                    Column(
                      children: [
                        Container(
                          //color: Colors.orange,
                          alignment: Alignment.bottomCenter,
                          //  margin: EdgeInsets.symmetric(vertical: 20),
                          height: 70,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    "dale de sole",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.star_border,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        //Expanded(child: SizedBox()),
                      ],
                    ),
                    Positioned(
                      top: 70,
                      left: 100,
                      child: Container(
                        // color: Colors.cyan,
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          "images/pngarea.com_red-paint-bucket-2613180.png",
                          width: 160,
                          height: 250,
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: exaples.length,
                separatorBuilder: (context, int index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: (){
                //      select.chargeasset(exaples[index]);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>image_client()));
                    },
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("${exaples[index]}"),
                          fit: BoxFit.fill,
                          //  colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.dstATop)
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.grey[400],
            ),
            Container(
              height: 240,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                            child: Text(
                          "Sapient gleelak",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: 40,
                            child: Text(
                              "${1700 * qntt}Da",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              "select your color",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      actions: [
                                        FlatButton(
                                          textColor: currentColor,
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Done"),
                                        )
                                      ],
                                      titlePadding: const EdgeInsets.all(0.0),
                                      contentPadding: const EdgeInsets.all(0.0),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: currentColor,
                                          onColorChanged: changeColor,
                                          colorPickerWidth: 300.0,
                                          pickerAreaHeightPercent: 0.7,
                                          enableAlpha: true,
                                          displayThumbColor: true,
                                          showLabel: true,
                                          paletteType: PaletteType.hsv,
                                          pickerAreaBorderRadius:
                                              const BorderRadius.only(
                                            topLeft: const Radius.circular(2.0),
                                            topRight:
                                                const Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: currentColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 60,
                    child: Row(
                      children: [
                        Text(
                          "select your size",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedsize = index;
                                      });
                                    },
                                    child: Center(
                                      child: Container(
                                        width: 60,
                                        height: 40,
                                        decoration: selectedsize == index
                                            ? BoxDecoration(
                                          color: currentColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                        )
                                            : BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.grey[800])),
                                        child: Center(
                                          child: Text(
                                            "${sizes[index]}Kg",
                                            style: TextStyle(
                                              color: useWhiteForeground(currentColor) && selectedsize == index
                                                  ? const Color(0xffffffff)
                                                  : const Color(0xff000000),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: sizes.length,
                                separatorBuilder: (context, int index) {
                                  return SizedBox(
                                    width: 4,
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Text(
                              "select the quantity",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )),
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    if(qntt > 1){
                                      setState(() {
                                        qntt -- ;
                                      });
                                    }

                                  },
                                  icon: Text("-",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                                ),
                                Center(child: Container(
                                    width: 30,
                                    child: Text('$qntt',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),))),
                                IconButton(
                                  onPressed: (){
                                    setState(() {
                                      qntt ++ ;
                                    });
                                  },
                                  icon: Text("+",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                )
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Center(
                      child: Text(
                        "Add to bag",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class image_client extends StatefulWidget {
  @override
  _image_clientState createState() => _image_clientState();

}

class _image_clientState extends State<image_client> {
  @override

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    ) ;
  //  var select = Provider.of<appprovider>(context) ;
//    return Container(
//        height: 400,
//        width: double.infinity,
//        color: Colors.transparent,
//        child: PhotoView(
//          imageProvider:AssetImage(
//            "${select.asset}"
//          )
//        ));
  }
}


