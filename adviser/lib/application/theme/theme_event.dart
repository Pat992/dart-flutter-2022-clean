part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeRequestEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}

class ThemeSetEvent extends ThemeEvent {
  final bool theme;
  const ThemeSetEvent({required this.theme});

  @override
  List<Object?> get props => [];
}

class ThemeToggleEvent extends ThemeEvent {
  @override
  List<Object?> get props => [];
}
