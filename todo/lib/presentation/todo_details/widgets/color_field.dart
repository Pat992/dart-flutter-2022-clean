import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/todo/form/todo_form_bloc.dart';
import 'package:todo/domain/entities/todo/color_entity.dart';

class ColorField extends StatelessWidget {
  final ColorEntity color;
  const ColorField({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        // Makes the list view bouncy when over-scrolling
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: ColorEntity.predefinedColors.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final itemColor = ColorEntity.predefinedColors[index];
          return InkResponse(
            onTap: () {
              BlocProvider.of<TodoFormBloc>(context)
                  .add(TodoFormColorChangedEvent(color: itemColor));
            },
            child: Material(
              color: itemColor,
              elevation: 10,
              shape: CircleBorder(
                side: BorderSide(
                  width: 2,
                  color: itemColor == color.color
                      ? Colors.white
                      : Colors.transparent,
                ),
              ),
              child: const SizedBox(width: 50, height: 50),
            ),
          );
        },
      ),
    );
  }
}
