import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_bloc/Data/Model/post_model.dart';
import 'package:post_bloc/Domain/post_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  PostRepository postRepository = PostRepository.instance;

  HomeBloc() : super(
      const HomeInitialState([])) {
    on<HomePostGetEvent>(getPosts);
    on<HomeDeleteEvent>(deletePost);
    on<HomeUpdateEvent>(updatePost);
    on<HomeCreateEvent>(createPost);
  }




  Future<void> getPosts(HomePostGetEvent event, Emitter<HomeState> emit) async {
    var result = await postRepository.getAllPost();
    emit(HomePostGetState(result));
  }

  Future<void> deletePost(HomeDeleteEvent event, Emitter<HomeState> emit) async {
    final state = this.state;
    if(state is HomePostGetState){
      emit( HomePostLoadingState());
      await postRepository.deletePost(event.id);
    }
    var result = await postRepository.getAllPost();
    emit(HomePostGetState(result));
  }

  Future<void> updatePost(HomeUpdateEvent event, Emitter<HomeState> emit) async {
    final state = this.state;
    if(state is HomePostGetState){
      emit( HomePostLoadingState());
      await postRepository.updatePost(event.post);
    }
    var result = await postRepository.getAllPost();
    emit(HomePostGetState(result));
  }

  Future<void> createPost(HomeCreateEvent event, Emitter<HomeState> emit) async {
    final state = this.state;
    if(state is HomePostGetState){
      emit( HomePostLoadingState());
      await postRepository.createPost(event.post);
    }
    var result = await postRepository.getAllPost();
    emit(HomePostGetState(result));
  }



}
