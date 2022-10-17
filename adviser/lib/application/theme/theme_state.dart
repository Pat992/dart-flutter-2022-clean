part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeStateLoading extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeStateLoaded extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeStateError extends ThemeState {
  final String errorMessage;
  const ThemeStateError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
