import 'package:best_app/Pages/Add_list.dart';
import 'package:best_app/Pages/stack.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  final MyStack<Map<String,String>> stack;
NoteList({Key? key, required this.stack}) : super(key: key);
  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: 14,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: widget.stack.length,
              itemBuilder:(context,index){
              final task=widget.stack.items[index];
              return _buildTaskTile(
                task['title'] as String,
                task['description'] as String,
              );
              }
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'main_add_button',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add_list(stack: widget.stack)),
          ).then((_) {
            // To refresh the UI after coming back from Add_list
            setState(() {});
          });

        },
        child: Icon(Icons.add),
      ),
    );
  }


  // Helper method to build task tiles
  Widget _buildTaskTile(String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.green,
            child: const Icon(
              Icons.person,
              size: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed:(){},
            child: Text(
                "Edit",
              style: TextStyle(color: Colors.green),
            ),
          )
        ],
      ),

    );
  }
}
