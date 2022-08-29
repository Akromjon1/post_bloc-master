part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomePostGetEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeDeleteEvent extends HomeEvent{
  String id;

 HomeDeleteEvent({required this.id});

  @override
  List<Object?> get props => [];
}

class HomeUpdateEvent extends HomeEvent{
  Post post;

  HomeUpdateEvent({required this.post});

  @override
  List<Object?> get props => [];
}

class HomeCreateEvent extends HomeEvent{
  Post post;

  HomeCreateEvent({required this.post});

  @override
  List<Object?> get props => [];
}