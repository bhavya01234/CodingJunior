import 'package:code_text_field/code_text_field.dart';
import 'package:codingjunior/try.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  late CodeController _codeController;
  String _selectedLanguage = 'dart'; // Default language is Dart

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(text: _getDefaultCode());
  }

  String _getDefaultCode() {
    switch (_selectedLanguage) {
      case 'java':
        return "public class Main\n{\n\tpublic static void main(String[] args) {\n\t\tSystem.out.println(\"Hello World\");\n\t}\n}";
      case 'python':
        return "print ('Hello World')";
      case 'cpp':
        return "#include <iostream>\n\nint main()\n{\n\tstd::cout << \"Hello World\";\n\treturn 0;\n}";
      default:
        return "void main() {\n\tprint(\"Hello, world!\");\n}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Code Editor"),
        backgroundColor: Colors.lime, // Preserve the existing app bar color
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.language),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                child: Text('Dart'),
                value: 'dart',
              ),
              PopupMenuItem<String>(
                child: Text('C++'),
                value: 'cpp',
              ),
              PopupMenuItem<String>(
                child: Text('Python'),
                value: 'python',
              ),
              PopupMenuItem<String>(
                child: Text('Java'),
                value: 'java',
              ),
            ],
            onSelected: (String value) {
              // Handle selection of language
              setState(() {
                _selectedLanguage = value;
                _codeController.text = _getDefaultCode(); // Update code controller text
              });
            },
          ),
        ],
      ),
      backgroundColor: Colors.greenAccent.shade100, // Preserve the existing background color
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: CodeField(
            controller: _codeController,
            textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 20),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Plagiarism warning: Ensure originality to avoid penalties. Be honest in your work.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red, // Customize the text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                String codeText = _codeController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Try(code: codeText)),
                );
              },
              child: Text(
                'Highlight Code',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Adjust button padding
              ),
            ),
          ),
        ],
      ),
    );
  }
}
