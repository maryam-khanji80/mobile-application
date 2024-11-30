import 'package:flutter/material.dart';
import 'package:liu_project/tones.dart';

class MyDropdownMenuwidget extends StatefulWidget {
  final Function(Tones) updateskin1;
  const MyDropdownMenuwidget({super.key, required this.updateskin1});

  @override
  State<MyDropdownMenuwidget> createState() => _MyDropdownMenuwidgetState();
}

class _MyDropdownMenuwidgetState extends State<MyDropdownMenuwidget> {
  Tones? selectedTone;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Tones>(
      value: selectedTone,
      hint: const Text('Select a tone'),
      items: skin1
          .map((Tones tone) => DropdownMenuItem<Tones>(
                value: tone,
                child: Text(tone.toString()),
              ))
          .toList(),
      onChanged: (Tones? newTone) {
        if (newTone != null) {
          setState(() {
            selectedTone = newTone;
          });
          widget.updateskin1(newTone);
        }
      },
    );
  }
}

class img extends StatelessWidget {
  const img({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Image Example'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Displaying an image from assets
              Image.asset('assets/toone.png', width: 100, height: 100),

              SizedBox(height: 20),
            ]),
      ),
    );
  }
}
