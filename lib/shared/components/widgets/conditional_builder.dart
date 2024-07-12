import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'item_list.dart';

Widget tasksBuilder({
  required List<Map> tasks,
}
    ) => ConditionalBuilder(
    condition: tasks.isNotEmpty,
    builder: (context) => ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[200],
          ),
        );
      },
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return getItemList(tasks[index], context);
      },
    ),
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.menu,
            size: 90,
            color: Colors.grey,
          ),
          Text(
            'No Tasks Yet,Please Add Some Tasks',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey),
          ),
        ],
      ),
    ));