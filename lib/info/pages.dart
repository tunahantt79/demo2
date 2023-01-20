import 'package:demo2/info/ba%C5%9Fkan_page.dart';
import 'package:demo2/info/belediye_page.dart';
import 'package:demo2/info/foto%C4%9Fraflar_page.dart';
import 'package:demo2/info/habeler_page.dart';
import 'package:demo2/info/ileti%C5%9Fim.dart';
import 'package:demo2/info/imar_durumu_page.dart';
import 'package:demo2/info/mekanlar_page.dart';
import 'package:demo2/info/n%C3%B6bet%C3%A7i_eczaneler_page.dart';
import 'package:flutter/material.dart';

List<Widget> page = [
  const HaberlerPage(),
  const BelediyePage(),
  const BaskanPage(),
  Container(),
  const MekanlarPage(),
  const FotograflarPage(),
  Container(
    color: Colors.amber,
  ),
  const ImarDurumuPage(),
  const EczanePage(),
  const IletisimPage(),
];
