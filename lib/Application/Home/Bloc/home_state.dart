part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitialState extends HomeState {
  final List<Post> items;
  @override
  List<Object> get props => [items];

  const HomeInitialState(this.items);
}
class HomePostLoadingState extends HomeState{
  @override
  List<Object?> get props => [];
}
class HomePostGetState extends HomeState{
  final List<Post> items;

  @override
  List<Object> get props => [items];

  const HomePostGetState(this.items);
}

class HomeUpdatePostLoading extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HomeUpdatePostLoaded extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}