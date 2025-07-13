import 'package:flutter/material.dart';
import 'stack.dart';
class Add_list extends StatefulWidget {
  final MyStack<Map<String, String>> stack;

  const Add_list({Key? key, required this.stack}) : super(key: key);


  @override
  State<Add_list> createState() => _Add_listState();
}

class _Add_listState extends State<Add_list> {
  final _formKey=GlobalKey<FormState>();
final TextEditingController _titleController=TextEditingController();
final TextEditingController _descriptionController=TextEditingController();
void _saveTask(){
  if(_formKey.currentState!.validate()){
    final newTask={
      'title':_titleController.text,
      'description':_descriptionController.text
    };
    widget.stack.push(newTask);
    Navigator.pop(context);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'New Task',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: 14,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              child: Form( // ✅ wrap everything in a Form
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildInputField(
                      controller: _titleController,
                      label: "Title",
                      hint: "Enter Task's Title",
                      validatorMessage: "Please enter a title",
                    ),
                    const SizedBox(height: 12),
                    _buildInputField(
                      controller: _descriptionController,
                      label: "Description",
                      hint: "Enter Task's Description",
                      validatorMessage: "Please enter a description",
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 3,
                      ),
                      onPressed: _saveTask,
                      icon: const Icon(Icons.save, size: 18, color: Colors.white),
                      label: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
  required TextEditingController controller,
  required String label,
  required String hint,
  required String validatorMessage,
}) {
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
    padding: const EdgeInsets.all(8),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
    ),
  );
}

}
