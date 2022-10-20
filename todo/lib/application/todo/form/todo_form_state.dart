part of 'todo_form_bloc.dart';

@immutable
class TodoFormState {
  final TodoEntity todo;
  final bool showErrorMessages;
  final bool isSaving;
  final bool isEditing;
  final Option<Either<Unit, Failure>> successOrFailureOption;

  const TodoFormState({
    required this.todo,
    required this.showErrorMessages,
    required this.isSaving,
    required this.isEditing,
    required this.successOrFailureOption,
  });

  factory TodoFormState.initial() => TodoFormState(
        todo: TodoEntity.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        successOrFailureOption: none(),
      );

  TodoFormState copyWith({
    TodoEntity? todo,
    bool? showErrorMessages,
    bool? isSaving,
    bool? isEditing,
    Option<Either<Unit, Failure>>? successOrFailureOption,
  }) {
    return TodoFormState(
      todo: todo ?? this.todo,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      isSaving: isSaving ?? this.isSaving,
      isEditing: isEditing ?? this.isEditing,
      successOrFailureOption:
          successOrFailureOption ?? this.successOrFailureOption,
    );
  }
}
