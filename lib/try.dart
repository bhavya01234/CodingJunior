import 'package:codingjunior/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class Try extends StatefulWidget {
  final String code;

  const Try({Key? key, required this.code}) : super(key: key);

  @override
  State<Try> createState() => _TryState();
}

class _TryState extends State<Try> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Code Highlighter'),
        backgroundColor: Colors.yellow, // Custom app bar color
      ),
      body: Column(

        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: HighlightView(
                // The original code to be highlighted
                widget.code,
                // Specify language
                // It is recommended to give it a value for performance
                language: 'dart',
                // Specify highlight theme
                // All available themes are listed in `themes` folder
                theme: githubTheme,
                // Specify padding
                padding: EdgeInsets.all(12),
                // Specify text style
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add your submit button logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Questions()),
                );

              },
              child: Text(
                  'Submit',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Adjust button padding
                textStyle: TextStyle(fontSize: 18), // Adjust button text size
                backgroundColor: Colors.yellow.shade400, // Custom button color
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey, // Custom background color
    );
  }
}
