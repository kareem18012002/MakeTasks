import 'package:flutter/material.dart';
import '../../../layout/todo_app/app/cubit.dart';

Widget getItemList(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child:  Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            CircleAvatar(
  
              radius: 40,
  
              child: Text('${model["time"]}'),
  
            ),
  
            const SizedBox(
  
              width: 15,
  
            ),
  
            Expanded(
  
              child: Column(
  
                mainAxisSize: MainAxisSize.min,
  
                children: [
  
                  Text(
  
                    '${model["title"]}',
  
                    style: const TextStyle(
  
                        fontSize: 25, fontWeight: FontWeight.bold),
  
                  ),const SizedBox(height: 6,),
  
                  Text(
  
                    '${model["date"]}',
  
                    style: TextStyle(fontSize: 18, color: Colors.grey[400]),
  
                  ),
  
                ],
  
              ),
  
            ),
  
            IconButton(
  
                onPressed: () {
  
                  AppCubit.get(context)
  
                      .updateData(status: 'done', id: model['id']);
  
                },
  
                icon: const Icon(
  
                  Icons.check_box,
  
                  color: Colors.green,
  
                  size: 32,
  
                )),
  
            IconButton(
  
                onPressed: () {
  
                  AppCubit.get(context)
  
                      .updateData(status: 'archive', id: model['id']);
  
                },
  
                icon: const Icon(
  
                  Icons.archive,
  
                  color: Colors.grey,
  
                  size: 32,
  
                )),
  
          ],
  
        ),
  
      ),
  onDismissed: (direction) {
      AppCubit.get(context).deleteData(id: model['id'],);
  },
);
