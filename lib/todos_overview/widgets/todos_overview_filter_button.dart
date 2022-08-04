import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/todos_overview/todos_overview.dart';

class TodosOverviewFilterButton extends StatelessWidget {
  const TodosOverviewFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final activeFilter =
        context.select((TodosOverviewBloc bloc) => bloc.state.filter);

    return PopupMenuButton<TodosViewFilter>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      initialValue: activeFilter,
      tooltip: "Filter",
      onSelected: (filter) {
        context
            .read<TodosOverviewBloc>()
            .add(TodosOverviewFilterChanged(filter));
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: TodosViewFilter.all,
            child: Text("All"),
          ),
          PopupMenuItem(
            value: TodosViewFilter.activeOnly,
            child: Text("Active only"),
          ),
          PopupMenuItem(
            value: TodosViewFilter.completedOnly,
            child: Text("Completed only"),
          ),
        ];
      },
      icon: const Icon(Icons.filter_list_rounded),
    );
  }
}
