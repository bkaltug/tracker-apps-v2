import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> toDoList = [];
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddAlertDialog(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                onTap: () => _showItemAlertDialog(context, toDoList[index]),
                child: Dismissible(
                  onDismissed: (direction) => setState(() {
                    toDoList.remove(toDoList[index]);
                  }),
                  key: UniqueKey(),
                  child: Card(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Text(
                          toDoList[index],
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<void> _showAddAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add Item"),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(hintText: "Note"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a note.";
                  }
                  return null;
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        toDoList.add(controller.text);
                        controller.clear();
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }

  Future<void> _showItemAlertDialog(BuildContext context, String item) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Note"),
            content: Text(item),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }
}
