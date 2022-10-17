import 'package:adviser/domain/repositories/theme_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;
  bool isDarkMode = true;

  ThemeBloc({required this.themeRepository}) : super(ThemeInitial()) {
    on<ThemeRequestEvent>((event, emit) async {
      emit(ThemeStateLoading());
      try {
        final theme = await themeRepository.getTheme();

        theme.fold(
          (theme) => isDarkMode = theme,
          (failure) => isDarkMode = true,
        );
        emit(ThemeStateLoaded(theme: isDarkMode));
      } catch (e) {
        isDarkMode = true;
        emit(ThemeStateLoaded(theme: isDarkMode));
      }
    });

    on<ThemeSetEvent>((event, emit) async {
      emit(ThemeStateLoading());
      try {
        isDarkMode = event.theme;
        await themeRepository.setTheme(themeMode: event.theme);
        emit(ThemeStateLoaded(theme: isDarkMode));
      } catch (e) {
        isDarkMode = true;
        emit(ThemeStateLoaded(theme: isDarkMode));
      }
    });

    on<ThemeToggleEvent>((event, emit) async {
      emit(ThemeStateLoading());
      try {
        ThemeSetEvent(theme: !isDarkMode);
      } catch (e) {
        isDarkMode = true;
        emit(ThemeStateLoaded(theme: isDarkMode));
      }
    });
  }
}
