import 'package:flutter/material.dart';

class Tones {
  String skin;
  String tone;
  Color color;
  Color color2;
  Tones(this.skin, this.tone,this.color , this.color2);


  @override
  String toString() {
    return 'Skin Tone: $skin';
  }
}

List<Tones> skin1 = [
  Tones('Porcelain', 'cold', Colors.blue , Colors.orange),
  Tones('Fair', 'cold', Colors.lightBlue , Colors.deepPurple),
  Tones('Light Rose', 'cold', Colors.pink.shade400 , Colors.green.shade300),
  Tones('Deep Ebony', 'cold', Colors.black , Colors.blue.shade800),
  Tones('Cool Brown', 'cold', Colors.brown , Colors.green.shade600), 
  Tones('Dark Chocolate', 'cold', Colors.brown.shade700 , Colors.white),
  Tones('Ivory', 'warm', Colors.yellow.shade100 , Colors.white54),
  Tones('Peach', 'warm', Colors.orange.shade300 , Colors.red),
  Tones('Light Beige', 'warm', Colors.brown.shade200 ,Colors.pink.shade700),
  Tones('Golden Brown', 'warm', Colors.amber , Colors.blueGrey),
  Tones('Warm Mahogany', 'warm', Colors.brown.shade400 , Colors.indigo),
  Tones('Deep Tan', 'warm', Colors.orange.shade900 , Colors.yellowAccent),
];
