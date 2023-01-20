import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IletisimPage extends StatefulWidget {
  const IletisimPage({super.key});

  @override
  State<IletisimPage> createState() => _IletisimPageState();
}

final Uri _urlTel = Uri.parse('tel:4441603');
final Uri _urlInstagram = Uri.parse('https://www.instagram.com/niluferbel/');
final Uri _urlTwitter = Uri.parse('https://twitter.com/NiluferBel');
final Uri _urlYouTube = Uri.parse('https://www.youtube.com/NiluferBel');
final Uri _urlFacebook = Uri.parse('https://www.facebook.com/NiluferBel');
final Uri _urlEposta = Uri.parse('mailto:nilufer@nilufer.bel.tr');

class _IletisimPageState extends State<IletisimPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
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
                    color: Colors.cyan[800],
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
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: GestureDetector(
                onTap: () {
                  _launchTel();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade800,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.phone,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '444 16 03',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  _launchEposta();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade800,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.mail,
                            size: 25,
                            color: Colors.cyan.shade800,
                          ),
                        ),
                      ),
                      Text(
                        'E-posta Gönder',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade800,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Haritada Göster',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  _launchFacebook();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.facebook,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Facebook',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  _launchTwitter();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Twitter',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  _launchYouTube();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade800,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'YouTube',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: _launchInstagram,
                child: Container(
                  decoration: BoxDecoration(),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Stack(fit: StackFit.expand, children: [
                    Image.asset(
                      'assets/images/indir.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Instagram',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
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
      ]),
    );
  }
}

Future<void> _launchTel() async {
  if (!await launchUrl(_urlTel)) {
    throw 'Could not launch $_urlTel';
  }
}

Future<void> _launchInstagram() async {
  if (!await launchUrl(_urlInstagram)) {
    throw 'Could not launch $_urlInstagram';
  }
}

Future<void> _launchEposta() async {
  if (!await launchUrl(_urlEposta)) {
    throw 'Could not launch $_urlEposta';
  }
}

Future<void> _launchTwitter() async {
  if (!await launchUrl(_urlTwitter)) {
    throw 'Could not launch $_urlTwitter';
  }
}

Future<void> _launchYouTube() async {
  if (!await launchUrl(_urlYouTube)) {
    throw 'Could not launch $_urlYouTube';
  }
}

Future<void> _launchFacebook() async {
  if (!await launchUrl(_urlFacebook)) {
    throw 'Could not launch $_urlFacebook';
  }
}
