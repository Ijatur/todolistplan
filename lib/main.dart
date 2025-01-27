import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const DailyPlannerApp());
}

class DailyPlannerApp extends StatelessWidget {
  const DailyPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

// class Task {
//   String title;
//   String description;
//   bool isCompleted;
//   DateTime dueDate;

//   Task({
//     required this.title,
//     required this.description,
//     this.isCompleted = false,
//     required this.dueDate,
//   });
// }

// class PlannerScreen extends StatefulWidget {
//   const PlannerScreen({super.key});

//   @override
//   _PlannerScreenState createState() => _PlannerScreenState();
// }

// class _PlannerScreenState extends State<PlannerScreen> {
//   List<Task> _tasks = [];
//   List<Task> _filteredTasks = [];
//   final TextEditingController _searchController = TextEditingController();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _editTitleController = TextEditingController();
//   final TextEditingController _editDescriptionController =
//       TextEditingController();
//   DateTime _selectedDueDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//     //_initializeTasks();
//   }

//   void _searchTasks(String query) {
//     _filteredTasks.clear();
//     if (query.isEmpty) {
//       _filteredTasks.addAll(_tasks);
//     } else {
//       _filteredTasks.addAll(_tasks.where((task) =>
//           task.title.toLowerCase().contains(query.toLowerCase()) ||
//           task.description.toLowerCase().contains(query.toLowerCase())));
//     }
//     setState(() {});
//   }

//   // void _initializeTasks() {
//   //   _tasks.addAll([
//   //     Task(
//   //       title: "Morning Routine",
//   //       description: "Get ready for the day",
//   //       dueDate: DateTime.now().add(const Duration(hours: 1)),
//   //     ),
//   //     Task(
//   //       title: "Work Meeting",
//   //       description: "Discuss project status",
//   //       dueDate: DateTime.now().add(const Duration(hours: 3)),
//   //     ),
//   //     Task(
//   //       title: "Lunch Break",
//   //       description: "Grab lunch",
//   //       dueDate: DateTime.now().add(const Duration(hours: 5)),
//   //     ),
//   //     Task(
//   //       title: "Review Report",
//   //       description: "Review daily report",
//   //       dueDate: DateTime.now().add(const Duration(hours: 7)),
//   //     ),
//   //   ]);
//   // }

//   Future<void> _selectDateTime(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: _selectedDueDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );

//     if (pickedDate != null) {
//       TimeOfDay? pickedTime = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.fromDateTime(_selectedDueDate),
//       );

//       if (pickedTime != null) {
//         setState(() {
//           _selectedDueDate = DateTime(
//             pickedDate.year,
//             pickedDate.month,
//             pickedDate.day,
//             pickedTime.hour,
//             pickedTime.minute,
//           );
//         });
//       }
//     }
//   }

//   void _addTask() {
//     _titleController.clear();
//     _descriptionController.clear();
//     _selectedDueDate = DateTime.now();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Add Task'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 TextField(
//                   controller: _titleController,
//                   decoration: const InputDecoration(
//                     labelText: 'Title',
//                   ),
//                 ),
//                 TextField(
//                   controller: _descriptionController,
//                   decoration: const InputDecoration(
//                     labelText: 'Description',
//                   ),
//                 ),
//                 ListTile(
//                   title: const Text("Due Date and Time"),
//                   subtitle: Text(
//                     "${_selectedDueDate.year}-${_selectedDueDate.month.toString().padLeft(2, '0')}-${_selectedDueDate.day.toString().padLeft(2, '0')} "
//                     "${_selectedDueDate.hour.toString().padLeft(2, '0')}:${_selectedDueDate.minute.toString().padLeft(2, '0')}",
//                   ),
//                   trailing: const Icon(Icons.calendar_month),
//                   onTap: () => _selectDateTime(context),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Add'),
//               onPressed: () {
//                 setState(() {
//                   _tasks.add(Task(
//                     title: _titleController.text,
//                     description: _descriptionController.text,
//                     dueDate: _selectedDueDate,
//                   ));
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _editTask(Task task) {
//     _editTitleController.text = task.title;
//     _editDescriptionController.text = task.description;
//     DateTime editingDate = task.dueDate;

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Edit Task'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 TextField(
//                   controller: _editTitleController,
//                   decoration: const InputDecoration(
//                     labelText: 'Title',
//                   ),
//                 ),
//                 TextField(
//                   controller: _editDescriptionController,
//                   decoration: const InputDecoration(
//                     labelText: 'Description',
//                   ),
//                 ),
//                 ListTile(
//                   title: const Text("Due Date and Time"),
//                   subtitle: Text(
//                     "${editingDate.year}-${editingDate.month.toString().padLeft(2, '0')}-${editingDate.day.toString().padLeft(2, '0')} "
//                     "${editingDate.hour.toString().padLeft(2, '0')}:${editingDate.minute.toString().padLeft(2, '0')}",
//                   ),
//                   trailing: const Icon(Icons.calendar_month),
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: editingDate,
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2100),
//                     );
//                     if (pickedDate != null) {
//                       TimeOfDay? pickedTime = await showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.fromDateTime(editingDate),
//                       );
//                       if (pickedTime != null) {
//                         setState(() {
//                           editingDate = DateTime(
//                             pickedDate.year,
//                             pickedDate.month,
//                             pickedDate.day,
//                             pickedTime.hour,
//                             pickedTime.minute,
//                           );
//                         });
//                       }
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Delete'),
//               onPressed: () {
//                 _deleteTask(task);
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Update'),
//               onPressed: () {
//                 setState(() {
//                   task.title = _editTitleController.text;
//                   task.description = _editDescriptionController.text;
//                   task.dueDate = editingDate;
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteTask(Task task) {
//     setState(() {
//       _tasks.remove(task);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Daily Planner"),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(kToolbarHeight),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//               onChanged: (String value) {
//                 _searchTasks(
//                     value); // Update filtered tasks when the search query changes
//               },
//               onSubmitted: (String value) {
//                 _searchTasks(
//                     value); // Update filtered tasks when the search is submitted
//               },
//             ),
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount:
//             _filteredTasks.isEmpty ? _tasks.length : _filteredTasks.length,
//         itemBuilder: (context, index) {
//           final task = _filteredTasks.isEmpty
//               ? _tasks[index]
//               : _filteredTasks[index]; // Use filtered tasks if available
//           return ListTile(
//             title: Text(task.title),
//             subtitle: Text(
//               '${task.description}\nDue: ${task.dueDate.year}-${task.dueDate.month.toString().padLeft(2, '0')}-${task.dueDate.day.toString().padLeft(2, '0')} '
//               '${task.dueDate.hour.toString().padLeft(2, '0')}:${task.dueDate.minute.toString().padLeft(2, '0')}',
//             ),
//             isThreeLine: true,
//             trailing: Checkbox(
//               value: task.isCompleted,
//               onChanged: (bool? value) {
//                 setState(() {
//                   task.isCompleted = value ?? false;
//                 });
//               },
//             ),
//             leading: const Icon(Icons.task_alt),
//             onTap: () => _editTask(task),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addTask,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
