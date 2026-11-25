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
  State<StudyPlannerScreen> createState() =>
      _StudyPlannerScreenState();
}

class _StudyPlannerScreenState extends State<StudyPlannerScreen> {

  // LOGIC: Store study goals in a List of Maps
  List<Map<String, dynamic>> goals = [
    {
      'subject': 'Mathematics',
      'hours': 3,
      'done': false,
    },
    {
      'subject': 'Programming',
      'hours': 2,
      'done': false,
    },
    {
      'subject': 'Database',
      'hours': 4,
      'done': false,
    },
  ];

  // LOGIC: Add a sample goal
  void addGoal() {
    setState(() {
      goals.add({
        'subject': 'English',
        'hours': 2,
        'done': false,
      });
    });
  }

  // LOGIC: Toggle goal completion
  void toggleGoal(int index) {
    setState(() {
      goals[index]['done'] = !goals[index]['done'];
    });
  }

  // LOGIC: Delete a goal
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }

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

            // CONNECTION: Display goals from the list
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {

                  final goal = goals[index];

                  return Card(
                    child: ListTile(

                      // STATIC: Subject icon
                      leading: Icon(
                        goal['subject'] == 'Mathematics'
                            ? Icons.menu_book
                            : goal['subject'] == 'Programming'
                                ? Icons.computer
                                : Icons.science,
                        color: Colors.blue,
                      ),

                      // STATIC: Subject name
                      title: Text(
                        goal['subject'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: goal['done']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: goal['done']
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),

                      subtitle: Text(
                        'Study time: ${goal['hours']} hours',
                      ),

                      // STATIC
                      onTap: () {
                        toggleGoal(index);
                      },

                      // CONNECTION: Checkbox and delete button
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Checkbox(
                            value: goal['done'],
                            onChanged: (value) {
                              toggleGoal(index);
                            },
                          ),

                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              deleteGoal(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // CONNECTION: Floating Action Button adds a goal
      floatingActionButton: FloatingActionButton(
        onPressed: addGoal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
