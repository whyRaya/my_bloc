import 'package:flutter/material.dart';

class TodoPages extends StatelessWidget {
  const TodoPages({super.key});

  @override
  Widget build(BuildContext context) {
    final list = List.generate(
        20,
        (i) => Todo(
              'Todo $i',
              'A description of what needs to be done for Todo $i',
            ));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
      ),
      body: TodoList(todoList: list)
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key, required this.todoList});

  final List todoList;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.todoList.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(widget.todoList[index].title),
              onTap: () {
                _navigateToDetailScreen(context, widget.todoList[index]);
              },
            ));
  }

  Future<void> _navigateToDetailScreen(BuildContext context, Todo todo) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailScreen(todo: todo),
            settings: RouteSettings(
              arguments: todo,
            )));
    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted || result == null) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class DetailScreen extends StatelessWidget {
  // Redundant, only to display another option to send data besides ModalRoute
  const DetailScreen({super.key, required this.todo});

  // Declare a field that holds the Todo.
  final Todo todo;

  // The navigation arrow appears automatically when a prev route is available
  @override
  Widget build(BuildContext context) {
    final todoArg = ModalRoute.of(context)!.settings.arguments as Todo;
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todoArg.title),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(todoArg.description),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Close the screen and return "Yep!" as the result.
                    Navigator.pop(context, 'Yep! => ${todoArg.title}');
                  },
                  child: const Text('Yep!'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Close the screen and return "Yep!" as the result.
                    Navigator.pop(context, 'Nope! => ${todoArg.title}');
                  },
                  child: const Text('Nope!'),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}
