import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/todo_app/app/cubit.dart';
import '../../layout/todo_app/app/state.dart';
import '../../shared/components/widgets/conditional_builder.dart';

class MenuNav extends StatefulWidget {
  const MenuNav({Key? key}) : super(key: key);

  @override
  State<MenuNav> createState() => _MenuNavState();
}

class _MenuNavState extends State<MenuNav> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
