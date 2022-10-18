import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/domain/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignOutEvent>((even, emit) async {
      await authRepository.signOut();
      emit(AuthStateUnauthenticated());
    });

    on<AuthCheckRequestEvent>((event, emit) {
      final userOption = authRepository.getSignedIn();

      userOption.fold(
        () => emit(AuthStateUnauthenticated()),
        (user) => emit(AuthStateAuthenticated()),
      );
    });
  }
}
