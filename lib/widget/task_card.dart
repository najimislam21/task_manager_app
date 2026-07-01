import 'package:flutter/material.dart';
import 'package:task_manager/data/model/task_model.dart';

class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color CardColor;
  final VoidCallback refreshParent;

  const TaskCard({
    super.key, required this.taskModel, required this.CardColor, required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.taskModel.title.toString(),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
      ),
      subtitle: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.taskModel.description.toString()),

          Text('Date:${widget.taskModel.createdDate}'),

          Row(
            children: [
              Chip(
                label: Text(widget.taskModel.status.toString()),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),

              Spacer(),

              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_note, color: Colors.purple),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
