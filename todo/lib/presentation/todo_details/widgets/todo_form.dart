import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/form/todo_form_bloc.dart';
import 'package:todo/core/validators/body_validator.dart';
import 'package:todo/core/validators/title_validator.dart';

class TodoForm extends StatelessWidget {
  const TodoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final themeData = Theme.of(context);
    final textEditingControllerTitle = TextEditingController();
    final textEditingControllerBody = TextEditingController();

    late String body;
    late String title;

    String? validateBody(String? input) {
      final res = bodyValidator(input);
      if (res == null) {
        body = input!;
      } else {
        return res;
      }
    }

    String? validateTitle(String? input) {
      final res = titleValidator(input);
      if (res == null) {
        title = input!;
      } else {
        return res;
      }
    }

    // BlocConsumer has listener and builder :)
    return BlocConsumer<TodoFormBloc, TodoFormState>(
      // When editing text from todoEntity should be shown
      listenWhen: (prev, curr) => prev.isEditing != curr.isEditing,
      listener: (context, state) {
        textEditingControllerTitle.text = state.todo.title;
        textEditingControllerBody.text = state.todo.body;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Form(
            key: formKey,
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: textEditingControllerTitle,
                  validator: validateTitle,
                  cursorColor: themeData.textTheme.headline1?.color,
                  decoration: const InputDecoration(labelText: 'Title'),
                  maxLength: 100,
                  maxLines: 3,
                  minLines: 1,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: textEditingControllerBody,
                  validator: validateBody,
                  cursorColor: themeData.textTheme.headline1?.color,
                  decoration: const InputDecoration(labelText: 'Body'),
                  maxLength: 300,
                  maxLines: 9,
                  minLines: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
