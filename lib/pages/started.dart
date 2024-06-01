import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 48,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.5,
          color: Colors.white, // Example color
        ),
      ),
    );
  }
}

class SubtitleWidget extends StatelessWidget {
  final String text;

  const SubtitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 32,
          fontWeight: FontWeight.w200,
          letterSpacing: -0.5,
          color: Colors.white60, // Example color
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;

  const ButtonWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(255, 253, 253, 1), // Example color
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Colors.pink[800],
          ),
        ),
      ),
    );
  }
}

class Started extends StatelessWidget {
  const Started({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(115, 60, 71, 1), // Example color
                    borderRadius: BorderRadius.circular(30),
                  ),
                  constraints: BoxConstraints(maxWidth: 480),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://cdn.builder.io/api/v1/image/assets/TEMP/00b6535f2ed8d26e81e8003cb888e72849cd0855bd54093c986535027569af84?apiKey=9ddf1e92aea345b5a071da762e0b1421&',
                        width: 353,
                        fit: BoxFit.cover,
                      ),
                      const TitleWidget(text: 'Welcome'),
                      const SubtitleWidget(
                          text: 'to your buying and selling application'),
                      const ButtonWidget(text: 'Get started!'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
