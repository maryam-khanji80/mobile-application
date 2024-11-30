import 'package:flutter/material.dart';
import 'package:liu_project/Home.dart';

void main() {
  runApp(const MaterialApp(
    home: Training(),
  ));
}

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String selectedToneType = 'cold'; 

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dressing for Your Skin Tone',
            style: TextStyle(
              fontSize: 18,
              color: Colors.brown,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 249, 194),
        ),
        body: Center(
          child: Column(
            children: [
              FadeTransition(
                opacity: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Understanding your skin tone can have a significant impact on how you present yourself, regardless of whether you have fair or dark tan skin. Knowing what colors suit you best makes it easy to dress for every season. Find out your skin tone by taking our survey, and we'll teach you how to dress accordingly. With this understanding, you may design a wardrobe that accentuates and balances your distinct skin tone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.brown[500],
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      letterSpacing: 0.7,
                      shadows: [
                        Shadow(
                          color: const Color.fromARGB(204, 110, 51, 3)
                              .withOpacity(0.5),
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ListTile(
                    title: const Text('Cold'),
                    leading: Radio<String>(
                      value: 'cold',
                      groupValue: selectedToneType,
                      onChanged: (value) {
                        setState(() {
                          selectedToneType = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Warm'),
                    leading: Radio<String>(
                      value: 'warm',
                      groupValue: selectedToneType,
                      onChanged: (value) {
                        setState(() {
                          selectedToneType = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(toneType: selectedToneType),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Go to Home Page',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
