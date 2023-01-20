import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FotograflarPage extends StatefulWidget {
  const FotograflarPage({super.key});

  @override
  State<FotograflarPage> createState() => _HaberlerPageState();
}

class _HaberlerPageState extends State<FotograflarPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.cyan[900],
                      child: const BackButton(
                        color: Colors.white,
                      ),
                    ),
                    Container(),
                    Container(
                        color: Colors.white,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              size: 20,
                              color: Colors.cyan[900],
                            ))),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('HABERLER').snapshots(),
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
                        //  for (int i = 0; i < page.length; i++) return page[i];
                        return const FotograflarPage();
                      })),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withAlpha(90)),
                            height: size.height * 0.11,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    ds['text'].toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.network(ds['image'].toString()),
                                )
                              ],
                            )),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
