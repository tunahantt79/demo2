import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/info/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HaberlerPage extends StatefulWidget {
  const HaberlerPage({super.key});

  @override
  State<HaberlerPage> createState() => _HaberlerPageState();
}
final Uri _urlTel = Uri.parse('tel:4441603');
class _HaberlerPageState extends State<HaberlerPage> {
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
                    Container(
                        color: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              _launchTel();
                            },
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
            padding: const EdgeInsets.only(top: 70.0),
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
                        return const HaberlerPage();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                    height: size.height * 0.09,
                    child: Image.asset("assets/images/logo2.png")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
Future<void> _launchTel() async {
  if (!await launchUrl(_urlTel)) {
    throw 'Could not launch $_urlTel';
  }
}