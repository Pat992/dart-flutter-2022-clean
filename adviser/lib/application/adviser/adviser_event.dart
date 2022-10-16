part of 'adviser_bloc.dart';

@immutable
abstract class AdviserEvent with EquatableMixin {}

/// Event when button is pressed
class AdviserRequestedEvent extends AdviserEvent {
  @override
  List<Object?> get props => [];
}
