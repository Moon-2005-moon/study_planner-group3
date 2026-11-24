import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// STATIC: Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Study Planner',

      // STATIC: Home screen
      home: const StudyPlannerScreen(),
    );
  }
}

// STATIC: Study Planner screen
class StudyPlannerScreen extends StatefulWidget {
  const StudyPlannerScreen({super.key});
@override
State<StudyPlannerScreen> createState() => _StudyPlannerScreenState();
}
class _StudyPlannerScreenState extends State<StudyPlannerScreen> {
       // LOGIC: Study goals
List<Map<String, dynamic>> goals = [
  {'subject': 'Mathematics', 'hours': 3, 'done': false},
  {'subject': 'Programming', 'hours': 2, 'done': false},
  {'subject': 'Database', 'hours': 4, 'done': false},
];
@override
  Widget build(BuildContext context) {
    return Scaffold(
      // STATIC: App bar
      appBar: AppBar(
        title: const Text('My Study Planner'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      // STATIC: Main screen content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // STATIC: Heading
            const Text(
              'My Study Goals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // LOGIC: Display study goals
            Expanded(
            child: ListView.builder(
           itemCount: goals.length,
           itemBuilder: (context, index) {
           return Card(
           child: ListTile(
           leading: Checkbox(
           value: goals[index]['done'],
          onChanged: (value) {
             setState(() {
          goals[index]['done'] = value!;
    });
  },
),
title: Text(
  goals[index]['subject'],
  style: TextStyle(
    decoration: goals[index]['done']
        ? TextDecoration.lineThrough
        : TextDecoration.none,
  ),
),
           subtitle: const Text('Study time'),
           trailing: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Text('${goals[index]['hours']} Hours'),
    IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        setState(() {
          goals.removeAt(index);
        });
      },
    ),
  ],
),
        ),
      );
    },
  ),
),

            // STATIC: Second goal card
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.computer,
                  color: Colors.green,
                ),
                title: const Text('Programming'),
                subtitle: const Text('Study time'),
                trailing: const Text('2 Hours'),
              ),
            ),

            // STATIC: Third goal card
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.science,
                  color: Colors.orange,
                ),
                title: const Text('Database'),
                subtitle: const Text('Study time'),
                trailing: const Text('4 Hours'),
              ),
            ),
          ],
        ),
      ),

      // STATIC: Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
  setState(() {
    goals.add({
      'subject': 'Mobile Development',
      'hours': 2,
      'done': false,
    });
  });
},
        child: const Icon(Icons.add),
      ),
    );
  }
}