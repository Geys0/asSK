import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitialized extends AppEvent {}

class AppLoading extends AppEvent {}

class AppLoaded extends AppEvent {}

// States
abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppLoadingState extends AppState {}

class AppLoadedState extends AppState {
  final String message;

  const AppLoadedState({this.message = 'App is ready!'});

  @override
  List<Object> get props => [message];
}

// BLoC
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppInitialized>(_onAppInitialized);
    on<AppLoading>(_onAppLoading);
    on<AppLoaded>(_onAppLoaded);
  }

  void _onAppInitialized(AppInitialized event, Emitter<AppState> emit) {
    emit(AppLoadingState());
    // Simulate initialization
    Future.delayed(const Duration(seconds: 2), () {
      add(AppLoaded());
    });
  }

  void _onAppLoading(AppLoading event, Emitter<AppState> emit) {
    emit(AppLoadingState());
  }

  void _onAppLoaded(AppLoaded event, Emitter<AppState> emit) {
    emit(const AppLoadedState());
  }
}
