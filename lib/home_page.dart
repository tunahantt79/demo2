import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/info/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(
            height: size.height * 1,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('items').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const LinearProgressIndicator();
                }
                if (snapshot.hasError) {
                  debugPrint('erorrrrr ${snapshot.error}');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () => Navigator.of(
                        context,
                      ).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        //    for (int i = 0; i < page.length; i++) return page[i];
                        return page[index];
                      })),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withAlpha(110)),
                            height: size.height * 0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Image.asset(
                                  'assets/images/home.png',
                                  height: size.height * 0.07,
                                  width: size.width * 0.09,
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                        blurStyle: BlurStyle.inner)
                                  ]),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Text(
                                  ds['name'].toString(),
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
