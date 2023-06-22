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
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(list[index].title),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(todo: list[index]),
                          settings: RouteSettings(
                            arguments: list[index],
                          )));
                },
              )),
    );
  }
}

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.todo});

  // Declare a field that holds the Todo.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todoArg = ModalRoute.of(context)!.settings.arguments as Todo;
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todoArg.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(todoArg.description),
      ),
    );
  }
}
