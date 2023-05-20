import 'package:flutter/material.dart';

class cart extends StatefulWidget {
  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  int qntt = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            child: Row(
              children: [
                Text(
                  "My bag",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                itemBuilder: (context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 160,
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          child: Center(
                              child: Image.asset(
                            "images/pngarea.com_red-paint-bucket-2613180.png",
                            fit: BoxFit.fill,
                          )),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pienture gleelak",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "1700 Da",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Container(
                                  height: 50,
                                  width: 120,
//                                  color: Colors.green,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              if (qntt > 1) {
                                                setState(() {
                                                  qntt--;
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  color: Colors.grey[300]),
                                              child: Center(
                                                child: Text(
                                                  "-",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black26,

                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(child: Text("$qntt",style: TextStyle(fontSize: 18),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                                setState(() {
                                                  qntt++;
                                                });

                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(8)),
                                                  color: Colors.grey[300]),
                                              child: Center(
                                                child: Text(
                                                  "+",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black26,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: 10,
                separatorBuilder: (context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            child: Row(
              children: [
                Text(
                  "TOTAL :",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "2321 Da",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            child: Center(
              child: Container(
                child: Center(
                  child: Text(
                    "Confirm order",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
