import 'package:codingjunior/language.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  TextEditingController _searchController = TextEditingController();

  // Sample list of questions
  List<String> _questions = [
    "Question 1: Find the sum of two numbers.",
    "Question 2: Calculate factorial of a number.",
    "Question 3: Reverse a string.",
    "Question 4: Implement binary search algorithm.",
    "Question 5: Sort an array using bubble sort.",
    "Question 6: Find the maximum subarray sum.",
    // Add more questions as needed
  ];

  List<String> _filteredQuestions = [];



  @override
  void initState() {
    super.initState();
    _filteredQuestions = _questions;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredQuestions = _questions
          .where((question) => question.toLowerCase().contains(query))
          .toList();
    });
  }

  void _navigateToCLanguagePage(String question) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Language(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Question List'),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search for a question...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredQuestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredQuestions[index]),
                  onTap: () {
                    _navigateToCLanguagePage(_filteredQuestions[index]);
                    // Handle tapping on a question
                    // Navigate to question details screen or perform other actions
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
