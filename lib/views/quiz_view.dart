import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              _buildStatsRow(),
              SizedBox(height: 20),
              Text(
                'Recent Quizzes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildQuizList(),
              _buildNewQuizButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.bar_chart, color: Colors.teal),
        ),
        SizedBox(width: 10),
        Text(
          'Quiz Tracker',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _buildStatCard(
          value: '7',
          label: 'Total Quizzes',
          color: Colors.teal.shade50,
        ),
        SizedBox(width: 10),
        _buildStatCard(
          value: '4',
          label: 'Passed Quizzes',
          color: Colors.green.shade50,
        ),
        SizedBox(width: 10),
        _buildStatCard(
          value: '57%',
          label: 'Success Rate',
          color: Colors.orange.shade50,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizList() {
    return Expanded(
      child: ListView(
        children: [
          _buildQuizCard('quiz 1', 20, 30, 67, true),
          _buildQuizCard('quiz .w', 30, 30, 100, true),
          _buildQuizCard('quiz', 5, 30, 17, false),
        ],
      ),
    );
  }

  Widget _buildQuizCard(
    String title,
    int score,
    int total,
    int percentage,
    bool passed,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 60,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: passed ? Colors.green.shade50 : Colors.red.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$percentage%',
              textAlign: TextAlign.center,
              style: TextStyle(color: passed ? Colors.green : Colors.red),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  passed ? 'PASSED' : 'FAILED',
                  style: TextStyle(
                    color: passed ? Colors.green : Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text('Score: $score/$total'),
        ],
      ),
    );
  }

  Widget _buildNewQuizButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text('+ NEW QUIZ'),
    );
  }
}
