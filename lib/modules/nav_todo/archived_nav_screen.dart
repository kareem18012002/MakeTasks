import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/todo_app/app/cubit.dart';
import '../../layout/todo_app/app/state.dart';
import '../../shared/components/widgets/conditional_builder.dart';

class ArchiveNav extends StatelessWidget {
  const ArchiveNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
