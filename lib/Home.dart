

import 'package:flutter/material.dart';
import 'tones.dart';

class Home extends StatefulWidget {
  final String toneType;

  const Home({super.key, required this.toneType});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Tones? selectedSkinTone;
  String userName = '';
  bool isChecked = false;
  String resultMessage = '';
  bool showColor = false;

  void updateSkinTone(Tones skinTone) {
    setState(() {
      selectedSkinTone = skinTone;
    });
  }

  void showResult() {
    if (userName.isEmpty || selectedSkinTone == null || !isChecked) {
      setState(() {
        resultMessage = 'Please fill in all fields and check the box. ';
        showColor = false;
    
  
      });
    } else {
      setState(() {
        resultMessage = 
            'Hi $userName, your selected skin tone is ${selectedSkinTone!.skin}, and its color is:' ;
        showColor = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Tones> filteredTones =
        skin1.where((tone) => tone.tone == widget.toneType).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Tone Selection'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.brown),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter your name', hoverColor: Colors.brown,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  const Text('I agree to the terms and conditions' , style: TextStyle(color: Colors.brown),),
                ],
              ),
              const SizedBox(height: 20),
              DropdownButton<Tones>(
                value: selectedSkinTone,
                hint: const Text('Select a tone' ,selectionColor: Colors.brown,),
                items: filteredTones
                    .map((Tones tone) => DropdownMenuItem<Tones>(
                          value: tone,
                          child: Text(tone.skin), 
                        ))
                    .toList(),
                onChanged: (Tones? newTone) {
                  if (newTone != null) {
                    updateSkinTone(newTone);
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: showResult,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Show Result',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              if (resultMessage.isNotEmpty)
                Column(
                  children: [
                    Text(
                      resultMessage,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    if (showColor && selectedSkinTone != null)
                    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 50,
                            height: 50,
                            color: selectedSkinTone!.color,
                                              
                          ),
                        
                      
                      if (showColor && selectedSkinTone != null)
                      Container(
                        margin: const EdgeInsets.only(top: 10 , left: 10 ),
                        width: 50,
                        height: 50,
                        color: selectedSkinTone!.color2,
                    
                        ),
                        ],
                      ),

                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
