part of 'adviser_bloc.dart';

@immutable
abstract class AdviserEvent {}

/// Event when button is pressed
class AdviserRequestedEvent extends AdviserEvent {}
